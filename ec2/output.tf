# Output Block is used to print the Output 
# It prints the arguements
# Arguements is the data of the Instance being created

# For Printing the count output
# output "ec2_public_ip" {
#   value = aws_instance.my_instance[*].public_ip
# }

# output "ec2_private_ip" {
#   value = aws_instance.my_instance[*].private_ip
# }

# Output Public IPs of EC2 instances created with for_each
output "ec2_public_ip" {
  value = {
    for k, v in aws_instance.my_instance :
    k => v.public_ip
  }
}

# Output Private IPs of EC2 instances created with for_each
output "ec2_private_ip" {
  value = {
    for k, v in aws_instance.my_instance :
    k => v.private_ip
  }
}

# If you also want instance IDs (optional)
output "ec2_instance_ids" {
  value = {
    for k, v in aws_instance.my_instance :
    k => v.id
  }
}