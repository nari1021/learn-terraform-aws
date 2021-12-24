resource "aws_vpc" "aws-vpc-sheom-an1" {
    cidr_block = "10.0.0.0/16"

    tags = {
        Name = "aws-vpc-sheom-an1"
    }
}