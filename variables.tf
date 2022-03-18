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