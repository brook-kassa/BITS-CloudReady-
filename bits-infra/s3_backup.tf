resource "aws_s3_bucket" "bits_backup_site" {
  bucket        = "bits-${var.environment}-backup"
  force_destroy = true

  tags = {
    Name        = "Bits Backup Site"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_website_configuration" "backup_site" {
  bucket = aws_s3_bucket.bits_backup_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_public_access_block" "backup_site" {
  bucket = aws_s3_bucket.bits_backup_site.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "backup_policy" {
  bucket = aws_s3_bucket.bits_backup_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid       = "PublicReadGetObject",
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.bits_backup_site.arn}/*"
      }
    ]
  })
}
