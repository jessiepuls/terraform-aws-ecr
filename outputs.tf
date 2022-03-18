output "repo_url" {
    description = "The URL of the repository"
    value       = aws_ecr_repository.repo.repository_url
}

output "read_role_arn" {
    count       = var.create_read_role ? 1 : 0
    description = "ARN for the role that was created to read the ecr repository."
    value       = aws_iam_role.ecr_read_role.arn
}