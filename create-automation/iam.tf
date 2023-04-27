resource "aws_iam_role" "main" {
  name        = "modify-rds-ssm-automation-role"
  description = "Allows to modify AWS RDS Instances Class"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "AssumeServiceRoleForAWSSystemsManager"
        Principal = {
          Service = "ssm.amazonaws.com"
        }
      },
    ]
  })
  managed_policy_arns = [aws_iam_policy.main.arn]

  tags = {
    Name = "modify-rds-ssm-automation-role"
  }
}

resource "aws_iam_policy" "main" {
  name        = "modify-rds-ssm-automation-policy"
  description = "Allows to modify AWS RDS Instances Class"

  policy = jsonencode({
    Version : "2012-10-17"
    Statement : [
      {
        Sid : "RDSPolicy",
        Effect : "Allow",
        Action : [
          "rds:DescribeDBInstances",
          "rds:ModifyDBInstance",
          "rds:DescribeDBClusters"
        ],
        Resource : "*"
      },
      {
        Sid : "SSMPolicy",
        Effect : "Allow",
        Action : [
          "ssm:ListDocumentVersions",
          "ssm:StartAutomationExecution",
          "ssm:DescribeDocument",
          "ssm:ModifyDocumentPermission",
          "ssm:GetDocument",
          "ssm:ListDocuments",
          "ssm:GetParameters",
          "ssm:GetParameter",
          "ssm:StopAutomationExecution"
        ],
        Resource : "*"
      }
    ]
  })

  tags = {
    Name = "modify-rds-ssm-automation-policy"
  }
}
