# Creation of S3 Bucket

# here provider is AWS and my_bucket is an identifier
# We can take help from the documentation
# Provider is installed when we run terraform init

resource "aws_s3_bucket" "my_bucket" {
  bucket = "yyash-bucket-terraform"
}