output "vpc1"{
  value =  aws_vpc.babaji_vpc.id
}
output "subnet1_id" {
  value = aws_subnet.babaji_pub1.id
}
output "subnet2_id" {
  value = aws_subnet.babaji_pub2.id
}