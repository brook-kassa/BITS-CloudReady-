resource "aws_cloudwatch_log_group" "cloudwatch" {
  name              = "/aws/vpc/flow-logs/bits-${var.environment}"
  retention_in_days = 30
  log_group_class   = "STANDARD"

  tags = {
    Name = "bits-${var.environment}-cloudwatch"
  }
}

resource "aws_iam_role" "vpc_flow_logs" {
  name = "bits-${var.environment}-vpc-flow-logs-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Sid    = ""
      Effect = "Allow"
      Principal = {
        Service = "vpc-flow-logs.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = {
    Name = "bits-${var.environment}-vpc-flow-logs-role"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "bits-${var.environment}-rt-private"
  }
}

resource "aws_route_table_association" "private" {
  for_each       = aws_subnet.private
  subnet_id      = each.value.id
  route_table_id = aws_route_table.private.id
}
