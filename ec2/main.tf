# key pair
resource "aws_key_pair" "my_key" {
  key_name = "terra-key"
  public_key = file("id_ed25519.pub")
}

# VPC & Security group
resource "aws_default_vpc" "default" {
  
}

resource "aws_security_group" "my_security_group" {
  name = "automate-sg"
  description = "Terraform generated SG"
  vpc_id = aws_default_vpc.default.id

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

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "All Access"
  }

}

# ec2 instance creation
resource "aws_instance" "my_instance" {
  key_name = aws_key_pair.my_key.key_name
  security_groups = [aws_security_group.my_security_group.name]
  #instance_type = "t2.micro"
  instance_type = var.ec2_instance_type
  #ami = "ami-02b8269d5e85954ef"
  ami = var.ec2_ami_id

  root_block_device {
    volume_size = var.root_storage_type
    volume_type = "gp3"
  }

  tags = {
    name = "automated-ec2"
  }
  
}