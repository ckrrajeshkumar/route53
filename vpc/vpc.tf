resource "aws_vpc" "babaji_vpc"{
  cidr_block = var.vpccidr
  tags={
    Name = var.vpcname
  }
}
resource "aws_subnet" "babaji_pub1"{
  vpc_id = aws_vpc.babaji_vpc.id
  cidr_block = var.pubcidr1
  availability_zone = var.pubaz1
  map_public_ip_on_launch = true
  tags={
    Name = var.pubsubname1
  }
}
resource "aws_subnet" "babaji_pub2"{
  vpc_id = aws_vpc.babaji_vpc.id
  cidr_block = var.pubcidr2
  availability_zone = var.pubaz2
  map_public_ip_on_launch = true
  tags={
    Name = var.pubsubname2
  }
}
resource "aws_internet_gateway" "babaji-igw"{
  vpc_id = aws_vpc.babaji_vpc.id
  tags={
    Name = var.igwname
  }
}
resource "aws_route_table" "babaji-rt"{
  vpc_id = aws_vpc.babaji_vpc.id
  route{
    cidr_block = var.igwcidr
    gateway_id = aws_internet_gateway.babaji-igw.id
  }
  tags={
    Name = var.rtname
  }
}
resource "aws_route_table_association" "babaji-rta"{
  route_table_id = aws_route_table.babaji-rt.id
  subnet_id = aws_subnet.babaji_pub1.id
}
resource "aws_route_table_association" "babaji-rta1"{
  route_table_id = aws_route_table.babaji-rt.id
  subnet_id = aws_subnet.babaji_pub2.id
}
