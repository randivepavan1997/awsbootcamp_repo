resource "random_string" "suffix" {
  length           = 16
  special          = false
  upper            = false
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "my-tf-test-bucket-${random_string.suffix.result}"
  
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}