resource "aws_s3_bucket" "buckets" { 
  bucket = var.bucketname  # Unique name for each bucket

#   versioning {
#     enabled = var.enable_versioning
#   }
}

# S3 Versioning
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.buckets.id

  versioning_configuration {
    status = var.enable_versioning   # "Enabled"or "Suspended"
  }
}

# Server-side encryption
resource "aws_s3_bucket_server_side_encryption_configuration" "tf_state" {
  bucket = aws_s3_bucket.buckets.bucket

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}