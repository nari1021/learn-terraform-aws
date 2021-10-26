provider "aws" {
    region = "ap-northeast-2"
}

// VPC 생성
resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "vpc-terraform-an2"
    }
}

//Subnet 생성
resource "aws_subnet" "first_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.1.0/24"

    availability_zone = "ap-northeast-2a"
    tags = {
        Name = "subnet1-terraform-pub-an2"
    }
}

resource "aws_subnet" "second_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.2.0/24"

    availability_zone = "ap-northeast-2c"

    tags = {
        Name = "subnet2-terraform-pub-an2"
    }
}

resource "aws_subnet" "first_pri_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.3.0/24"

    availability_zone = "ap-northeast-2a"
    tags = {
        Name = "subnet1-terraform-pri-an2"
    }
}

resource "aws_subnet" "second_pri_subnet" {
    vpc_id = aws_vpc.main.id
    cidr_block = "10.0.4.0/24"

    availability_zone = "ap-northeast-2c"
    tags = {
        Name = "subnet2-terraform-pub-an2"
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
resource "aws_route_table" "route_table" {
    vpc_id = aws_vpc.main.id

    tags = {
        Nmae = "rt-terraform-an2"
    }
}

resource "aws_route_table_association" "route_table_association_1" {
    subnet_id = aws_subnet.first_subnet.id
    route_table_id = aws_route_table.route_table.id
}

resource "aws_route_table_association" "route_table_assciation_2" {
    subnet_id = aws_subnet.second_subnet.id
    route_table_id = aws_route_table.route_table.id
}
