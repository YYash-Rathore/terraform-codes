# Steps to create an EC2 Instance includes:
# (1) Key-Pair Generation
# (2) VPC and Security group Creation
# (3) Then EC2 Instance Creation

# We can take help from the documentation

# Below is the detailed IAC to create an EC2 Instance

# Step 1: Key Pair Generation
resource "aws_key_pair" "my_key" {
  key_name = "terra-key"
  public_key = file("id_ed25519.pub")
}

# Step 2: VPC and Security group creation

# using the Default VPC
resource "aws_default_vpc" "default" {
  
}

# Creation of Security group named automate-sg
resource "aws_security_group" "my_security_group" {
  name = "automate-sg"
  description = "Terraform generated SG"

  # Targetting the id of default VPC using interpolation
  vpc_id = aws_default_vpc.default.id

  # ingress : inbound rules
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH Open"
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP Open"
  }

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTPS Open"
  }

  # egress: outbound rules
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All Access"
  }

}

# EC2 Instacne Creation
resource "aws_instance" "my_instance" {
  # Using the public key
  key_name = aws_key_pair.my_key.key_name
  # Using the security group
  security_groups = [aws_security_group.my_security_group.name]
  #instance_type = "t2.micro"

  # Defining the Type and AMI for the instance
  instance_type = var.ec2_instance_type
  #ami = "ami-02b8269d5e85954ef"
  ami = var.ec2_ami_id

  # Defining the Volume of the Instance
  root_block_device {
    volume_size = var.root_storage_type
    volume_type = "gp3"
  }

  tags = {
    name = "automated-ec2"
  }
  
}