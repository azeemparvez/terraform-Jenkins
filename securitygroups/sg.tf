resource "aws_security_group" "sg1" {
  name        = var.sg_name
  description = "Allow ${var.sg-name} inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description      = "${var.sg_name} from VPC"
    from_port        = var.ingress_from_port
    to_port          = var.ingress_to_port
    protocol         = "tcp"
    cidr_blocks      = var.ingress_cidr_blocks
    #ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}