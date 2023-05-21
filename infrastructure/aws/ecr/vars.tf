variable "aws_region" {
  type = string
  description = "The AWS region where the repository will be created."
  nullable = false
}

variable "repository_name" {
  type = string
  description = "Name of the repository"
  nullable = false
}

variable "mutable_tags" {
  type = bool
  description = "If tags can be overwritten"
  default = true
}

variable "scan_on_push" {
  type = bool
  description = "If security scans should be performed on image push (This setting is deprecated on repository level)"
  default = false
}

variable "encryption_configuration" {
  type = object({
    encryption_type = string
    kms_key = string
  })
  description = "The encryption configuration for the ECR repository"
  nullable = true
}

variable "force_delete" {
  type = bool
  description = "Able to delete the ECR repository even if image still exist in the repository"
  default = false
}