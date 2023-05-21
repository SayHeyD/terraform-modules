resource "aws_ecr_repository" "ecr_repository" {
  name                 = var.repository_name
  image_tag_mutability = var.mutable_tags ? "MUTABLE" : "IMMUTABLE"

  dynamic "encryption_configuration" {
    for_each = var.encryption_configuration
    content {
      encryption_type = encryption_configuration.value["encryption_type"]
      kms_key = encryption_configuration.value["kms_key"]
    }
  }

  force_delete = var.force_delete

  image_scanning_configuration {
    scan_on_push = var.scan_on_push
  }
}