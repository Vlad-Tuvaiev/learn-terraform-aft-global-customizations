resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-test-bucket-${random_string.suffix.result}"
  acl    = "private"

  tags = {
    Name        = "My test bucket"
    Environment = "Test"
  }
}

resource "random_string" "suffix" {
  length  = 6
  special = false
}