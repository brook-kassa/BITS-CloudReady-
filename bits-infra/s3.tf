resource "aws_s3_bucket" "bits_site" {
  bucket = "bits-${var.environment}-landing"

  tags = {
    Name        = "BITS Landing Page"
    Environment = var.environment
  }
}

resource "aws_s3_bucket_website_configuration" "bits_site" {
  bucket = aws_s3_bucket.bits_site.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"
  }
}

resource "aws_s3_bucket_ownership_controls" "bits_site" {
  bucket = aws_s3_bucket.bits_site.id

  rule {
    object_ownership = "BucketOwnerEnforced"
  }
}

resource "aws_s3_bucket_public_access_block" "bits_site" {
  bucket = aws_s3_bucket.bits_site.id

  block_public_acls       = false
  ignore_public_acls      = false
  block_public_policy     = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bits_site_policy" {
  bucket = aws_s3_bucket.bits_site.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Sid : "PublicReadGetObject",
        Effect : "Allow",
        Principal : "*",
        Action : "s3:GetObject",
        Resource : "${aws_s3_bucket.bits_site.arn}/*"
      }
    ]
  })
}
