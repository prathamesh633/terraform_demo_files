resource "aws_security_group" "sg" {
  name        = var.security_group_name
  vpc_id      = var.vpc_id

    dynamic "ingress" {
    for_each = var.ingress_ports
    content {
        cidr_blocks  = ingress.value.cidr_blocks
        from_port    = ingress.value.from_port
        protocol     = ingress.value.protocol
        to_port      = ingress.value.to_port 
    }
  }

  egress {
    
    cidr_blocks    = ["0.0.0.0/0"]
    protocol       = "-1" # semantically equivalent to all ports
    from_port      = 0
    to_port        = 0
  }

}


  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # ingress {
  #   from_port   = 22
  #   to_port     = 22
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # egress {
  #   from_port   = 0
  #   to_port     = 0
  #   protocol    = "-1"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }
  # tags = {
  #   Name = "Demo_sg"
  # }
