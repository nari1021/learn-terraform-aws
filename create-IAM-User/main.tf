provider "aws" {
    region = "ap-northeast-2"
}

resource "aws_iam_user" "nari120" {
    name = "nari120"
}
