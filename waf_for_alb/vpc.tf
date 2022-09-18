resource "aws_vpc" "main" {
  cidr_block = "10.21.0.0/16"

  tags = {
    Name = "${local.resource_prefix}-vpc-${local.resource_suffix}"
  }
}

resource "aws_subnet" "main" {
  count             = length(var.alb_subnet_cidr_block)
  vpc_id            = aws_vpc.main.id
  availability_zone = "${var.region}${var.az[count.index]}"
  cidr_block        = var.alb_subnet_cidr_block[count.index]

  tags = {
    Name = "${local.resource_prefix}-subnet-${local.resource_suffix}-0${count.index + 1}"
  }
}

resource "aws_security_group" "alb" {
  name        = "${local.resource_prefix}-sg-alb-${local.resource_suffix}"
  description = "for ALB test"
  vpc_id      = aws_vpc.main.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${local.resource_prefix}-sg-alb-${local.resource_suffix}"
  }
}
