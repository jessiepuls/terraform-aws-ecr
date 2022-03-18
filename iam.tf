resource "aws_iam_role" "ecr_read_role" {
   name = "${var.repo_name}-read-role"
   assume_role_policy = jsonencode({
      Version = "2012-10-17",
      Statement = [
        {
          Action = "sts:AssumeRole",
          Principal = {
            Service = [
              "build.apprunner.amazonaws.com",
              "tasks.apprunner.amazonaws.com"
            ]
          },
          Effect = "Allow",
          Sid = "AppRunnerECRAccessRole"
        }
      ]
   })
}

resource "aws_iam_role_policy_attachment" "app_runner_ecr_role_attachment" {
  role       = aws_iam_role.ecr_read_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSAppRunnerServicePolicyForECRAccess"
}