resource "aws_instance" "babaji-web"{
  ami = var.amiid
  instance_type = var.intype
  count = length(var.pubcidr)
  subnet_id = element(aws_subnet.babaji-pub.*.id , count.index)
  security_groups = [aws_security_group.babaji-sg.id]
  user_data =file("install_httpd.sh")
  tags = {
    Name = "babaji-web${count.index + 1}"
  }
}