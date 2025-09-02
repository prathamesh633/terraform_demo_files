resource "aws_instance" "web" {
  ami           = var.ami # Example AMI ID, replace with a valid one
  instance_type = var.instance_type
  key_name = var.key # Replace with your key pair name
  vpc_security_group_ids = var.security_group
  tags = {
    Name = var.instance_name
  }
}




