data "aws_caller_identity" "current" {}

locals {
  total_repository = concat(var.next3_ecr_repository_name["fo"], var.next3_ecr_repository_name["bo"])
  iam_resource     = [for i in local.total_repository : "arn:aws:ecr:ap-northeast-2:${data.aws_caller_identity.current.account_id}:repository/${i}/*"]
}

resource "aws_ecr_repository" "next3" {
    count = length(local.total_repository)
    name  = element(local.total_repository, count.index)
}

resource "aws_ecr_lifecycle_policy" "next3" {
  count      = length(local.total_repository)
  repository = element(local.total_repository, count.index)

  policy = jsonencode({
    rules = [
      {
        rulePriority = 2
        description  = var.ecr_lifecycle_policy_description
        selection = {
          tagStatus   = "any"
          countType   = "imageCountMoreThan"
          countNumber = var.ecr_lifecycle_policy_image_count
        }
        action = {
          type = "expire"
        }
      }
    ]
  })

  depends_on = [
    aws_ecr_repository.next3
  ]
}

resource "aws_ecr_repository_policy" "next3" {
  count      = length(local.total_repository)
  repository = element(local.total_repository, count.index)

  policy = jsonencode({
    Version = "2008-10-17"
    Statement = [
      {
        Sid    = "new statement"
        Effect = "Allow"
        Principal = {
          AWS = aws_iam_user.next3.arn
        }
        Action = [
          "ecr:BatchCheckLayerAvailability",
          "ecr:BatchDeleteImage",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetDownloadUrlForLayer",
          "ecr:InitiateLayerUpload",
          "ecr:PutImage",
          "ecr:UploadLayerPart"
        ]
      }
    ]
  })

  depends_on = [
    aws_ecr_repository.next3
  ]
}

resource "aws_iam_policy" "next3" {
  name        = "test_policy"
  description = "My test policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "VisualEditor0"
        Effect = "Allow"
        Action = [
          "ecr:GetDownloadUrlForLayer",
          "ecr:BatchGetImage",
          "ecr:CompleteLayerUpload",
          "ecr:GetAuthorizationToken",
          "ecr:UploadLayerPart",
          "ecr:InitiateLayerUpload",
          "ecr:BatchCheckLayerAvailability",
          "ecr:PutImage"
        ]
        Resource = local.iam_resource
      },
    ]
  })
}

resource "aws_iam_user" "next3" {
  name = "test_ecr_user"

  tags = {
    Name = "test_ecr_user"
  }
}

resource "aws_iam_user_policy_attachment" "next3" {
  user       = aws_iam_user.next3.name
  policy_arn = aws_iam_policy.next3.arn
}
