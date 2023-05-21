output "repository_aws_region" {
  value = var.aws_region
}

output "repository_arn" {
  value = aws_ecr_repository.ecr_repository.arn
}

output "registry_id" {
  value = aws_ecr_repository.ecr_repository.registry_id
}

output "registry_url" {
  value = aws_ecr_repository.ecr_repository.repository_url
}