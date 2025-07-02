resource "aws_security_group" "babaji-sg"{
  vpc_id = var.vpc_id
  ingress{
    description = "ALLOW SSH"
    from_port = "22"
    to_port = "22"
    protocol = "tcp"
    cidr_blocks = var.block1
  }
  ingress{
    description ="ALLOW HTTP"
    from_port = "80"
    to_port = "80"
    protocol = "tcp"
    cidr_blocks = var.block2
  }
  egress{
    description = "OUTBOUND"
    from_port = 0
    to_port  = 0
    protocol = "-1"
    cidr_blocks = var.block3
  }
  tags={
    Name = var.sgname
  }
}
output "sg"{
  value = aws_security_group.babaji-sg.id
}