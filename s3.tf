# S3 Bucket
resource "aws_s3_bucket" "tfe_bucket" {
  bucket        = "tfe-data-bucket-${random_pet.hostname_suffix.id}"
  force_destroy = true

  tags = {
    Name = "stam-${random_pet.hostname_suffix.id}"
  }
}

resource "aws_s3_bucket_public_access_block" "tfe_bucket_access" {
  bucket = aws_s3_bucket.tfe_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.tfe_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}