provider "aws" {
    region = "ap-northeast-2"
}

# IAM User 생성
resource "aws_iam_user" "nari120" {
    name = "nari120"
}

# IAM Group 생성
resource "aws_iam_group" "terraform_group" {
    name = "terraform_test_group"
}

# IAM user -> IAM group에 등록
resource "aws_iam_group_membership" "terraforms" {
    name = aws_iam_group.terraform_group.name

    users = [
        aws_iam_user.nari120.name
    ]

    group = aws_iam_group.terraform_group.name
}
