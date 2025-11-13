variable "ec2_instance_type" {
  default = "t2.micro"
  type = string
}

variable "root_storage_type" {
  default = 15
  type = number
}

variable "ec2_ami_id" {
  default = "ami-02b8269d5e85954ef"
  type = string
}