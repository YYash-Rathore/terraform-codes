resource "local_file" "my_file" {
  filename = "automate.txt"
  content = "This file is created using Terraform"
}