provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_s3_bucket" "main" {
    bucket = "nari120-terraform-test"

    tags = {
        Name = "nari120-terraform-test"
    }
}

