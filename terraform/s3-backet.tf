resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-test-bucket-aaaaaabbbbbbcccccc"
  acl    = "private"

  tags = {
    Name        = "My test bucket"
    Environment = "Test"
  }
}