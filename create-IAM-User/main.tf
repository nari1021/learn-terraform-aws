# IAM User 생성
resource "aws_iam_user" "main" {
    name = "aws-test-iam-user-an2"
    tags = {
        Name = "aws-test-iam-user-an2"
    }
}

resource "aws_iam_policy" "main" {
    name        = "aws-test-iam-policy-an2"
    description = "ECR Image pull and push policy"
    
    policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Sid    = "PermissionForPutImage"
                Effect = "Allow"
                Action = "*"
                Resource = "*"
            }
        ]
    })
    
    tags = {
        Name    = "aws-test-iam-policy-an2"
    }
}

# 생성한 User 에 policy 연결
resource "aws_iam_user_policy_attachment" "main" {
  user       = aws_iam_user.main.name
  policy_arn = aws_iam_policy.main.arn
}


# IAM Role 생성
# SSM으로 EC2에 접속하기 위한 IAM role 생성
resource "aws_iam_role" "ec2" {
    name = "aws-test-iam-role-ec2-ecprd-an2"

    assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AssumeRoleForEC2Instance"
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })

  tags = merge(var.tags, {
    Name = "aws-test-iam-role-ec2-an2"
  })
}

# AmazonSSMManagedInstanceCore policy
data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  name = "AmazonSSMManagedInstanceCore"
}

# 생성한 role에 policy 연결
resource "aws_iam_role_policy_attachment" "ssm_ec2" {
  role       = aws_iam_role.ec2.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}

# EC2 인스턴스 profile 생성
resource "aws_iam_instance_profile" "main" {
    role = aws_iam_role.ec2.name
}
