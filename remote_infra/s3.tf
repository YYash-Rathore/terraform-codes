resource "aws_s3_bucket" "remote_bucket" {
  bucket = "terra_remote_bucket"

  tags = {
    Name        = "terra_remote_bucket"
  }
}