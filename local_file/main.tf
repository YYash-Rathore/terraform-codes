# Terraform Code Format:
# <Block> <Parameters> {  Arguements  }
# <Parameters> = <Resource Type> + <Resource Name>

# Creation of Local File using Terraform
resource "local_file" "my_file" {
  filename = "automate.txt"
  content = "This file is created using Terraform"
}