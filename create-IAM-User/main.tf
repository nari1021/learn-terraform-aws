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

# EC2 를 위한 IAM role 기본 생성
resource "aws_iam_role" "role-ec2" {
    name = "iam-role-terraform-test-ec2"
    path = "/"
    assume_role_policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "",
                "Effect": "Allow",
                "Principal": {
                    "Service": "ec2.amazonaws.com"
                },
                "Action": "sts:AssumeRole"
            }
        ]
    }
    EOF
}

resource "aws_iam_role_policy" "policy-s3" {
    name = "policy-terraform-test-s3"
    role = aws_iam_role.role-ec2.id
    policy = <<EOF
{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Sid": "AllowAppArtifactsReadAccess",
                "Effect": "Allow",
                "Action": [
                    "s3: GetObject"
                ],
                "Resource": "*"
            }
        ]
    }
    EOF

}

resource "aws_iam_instance_profile" "iam-profile" {
    name = "iam-profile"
    role = aws_iam_role.role-ec2.name
}

# IAM user에게 policy 할당
resource "aws_iam_user_policy" "admin" {
  name  = "Admin"
  user  = aws_iam_user.nari120.name

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
                "*"
            ],
            "Resource": [
                "*"
            ]
        }
    ]
}
EOF
}
