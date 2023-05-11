resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "aws-vpc-temp-an2"
  }
}

resource "aws_subnet" "public" {
  count      = length(var.public_subnet_cidr_list)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.public_subnet_cidr_list[count.index]

  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "subnet1-terraform-pub-an2"
  }
}

resource "aws_subnet" "private" {
  count      = length(var.private_subnet_cidr_list)
  vpc_id     = aws_vpc.main.id
  cidr_block = var.private_subnet_cidr_list[count.index]

  availability_zone = "ap-northeast-2a"
  tags = {
    Name = "subnet1-terraform-pri-an2"
  }
}

// Internet Gateway 생성
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "ig-terraform-an2"
  }
}

// Route Table 생성
resource "aws_route_table" "route_table_pub" {
  vpc_id = aws_vpc.main.id

  tags = {
    Nmae = "rt-terraform-pub-an2"
  }
}

resource "aws_route_table" "route_table_pri" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "rt-terraform-pri-an2"
  }
}

resource "aws_route_table_association" "route_table_association_1" {
  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.route_table_pub.id
}

resource "aws_route_table_association" "route_table_assciation_2" {
  subnet_id      = aws_subnet.public[1].id
  route_table_id = aws_route_table.route_table_pub.id
}

// EIP 생성
resource "aws_eip" "eip_nat" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip_nat.id
  subnet_id     = aws_subnet.public[0].id

  tags = {
    Name = "nat-terraform-an2"
  }
}

resource "aws_route_table_association" "route_table_association_pri_1" {
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.route_table_pri.id
}

resource "aws_route" "private_nat" {
  route_table_id         = aws_route_table.route_table_pri.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_gateway.id
}
