variable "repo_name" {
  type = string
}

variable "image_tag_mutability" {
    type = string
    default = "MUTABLE"
    validation {
        condition     = contains(["MUTABLE", "IMMUTABLE"], var.image_tag_mutability)
        error_message = "Allowed values for image_tag_mutability are \"MUTABLE\", \"IMMUTABLE\"."
    }
}

variable "create_read_role" {
  type = bool
  default = false
  description = "Optionally crate a read role for the ecr repository. If you do this the role arn will be an output of the module."
}