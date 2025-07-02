output "vpc_id"{
  value =  aws_vpc.babaji-vpc.id
}
output "subnet1_id" {
  value = aws_subnet.babaji-pub1.id
}
output "subnet2_id" {
  value = aws_subnet.babaji-pub2.id
}