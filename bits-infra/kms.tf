resource "aws_kms_key" "bits" {
  description             = "KMS key for BITS project"
  deletion_window_in_days = 30
  enable_key_rotation     = true

  tags = {
    Name = "bits-${var.environment}-kms"
  }
}

resource "aws_kms_alias" "bits" {
  name          = "alias/bits-${var.environment}-kms"
  target_key_id = aws_kms_key.bits.key_id
}

resource "aws_db_subnet_group" "bits" {
  name       = "bits-${var.environment}-db-subnet-group"
  subnet_ids = [for s in aws_subnet.private : s.id]

  tags = {
    Name = "bits-${var.environment}-db-subnet-group"
  }
}

data "aws_rds_engine_version" "postgres" {
  engine = "postgres"
}

resource "aws_db_instance" "bits_db" {
  identifier            = "bits-${var.environment}-db"
  engine                = "postgres"
  engine_version        = data.aws_rds_engine_version.postgres.version
  instance_class        = "db.t3.micro"
  allocated_storage     = 20
  max_allocated_storage = 100

  username = "postgres"
  password = var.db_password
  db_name  = "bitsdb"

  vpc_security_group_ids = [aws_security_group.db_sg.id]
  db_subnet_group_name   = aws_db_subnet_group.bits.name

  storage_encrypted = true
  kms_key_id        = aws_kms_key.bits.arn

  backup_retention_period = 7
  backup_window           = "03:00-04:00"
  maintenance_window      = "Sun:05:00-Sun:06:00"

  publicly_accessible = false
  storage_type        = "gp3"

  skip_final_snapshot = true
  deletion_protection = false

  iam_database_authentication_enabled = true
}


resource "aws_security_group" "db_sg" {
  name        = "bits-${var.environment}-db-sg"
  description = "Allow Postgres from within VPC"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "Postgres from VPC"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bits-${var.environment}-db-sg"
  }
}



