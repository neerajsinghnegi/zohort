provider "aws" {
  region = "ap-south-1"
}

resource "aws_s3_bucket" "this" {
  bucket = "zohort-devops-neerajsinghnegi"

  tags = {
    Name        = "zohort-devops-neerajsinghnegi"
    Environment = "dev"
  }
}

resource "aws_s3_bucket_versioning" "this" {
  bucket = aws_s3_bucket.this.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "this" {
  bucket = aws_s3_bucket.this.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "bucket_name" {
  value       = aws_s3_bucket.this.bucket
  description = "Name of the created S3 bucket"
}