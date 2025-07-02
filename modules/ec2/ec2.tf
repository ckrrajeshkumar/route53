resource "aws_instance" "babaji-web"{
  ami = var.amiid
  key_name = var.keypair
  instance_type = var.intype
  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.subnet_id
  user_data =file("install_httpd.sh")
  tags = {
    Name = var.ec2name1
  }
}
resource "aws_instance" "babaji-web1"{
  ami = var.amiid
  key_name = var.keypair
  instance_type = var.intype
  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.subnet_id
  user_data =file("install_httpd.sh")
  tags = {
    Name = var.ec2name2
  }
}
output "instance_id1" {
  value = aws_instance.babaji-web.id
}
output "instance_id2" {
  value = aws_instance.babaji-web1.id
}
