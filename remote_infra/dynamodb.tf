resource "aws_dynamodb_table" "terra_remote_db" {
  name           = "terra_remote_db"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }

  tags = {
    Name = "terra_remote_db"
  }
}