resource "aws_instance" "babaji-web"{
  ami = var.amiid
  key_name = var.keypair
  instance_type = var.intype
  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.subnet_id1
  user_data = file("${path.module}/install_httpd.sh")
  tags = {
    Name = var.ec2name1
  }
}
resource "aws_instance" "babaji-web1"{
  ami = var.amiid
  key_name = var.keypair
  instance_type = var.intype
  vpc_security_group_ids = [var.security_group_id]
  subnet_id = var.subnet_id2
  user_data = file("${path.module}/install_httpd.sh")
  tags = {
    Name = var.ec2name2
  }
}