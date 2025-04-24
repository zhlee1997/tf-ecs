variable "AWS_REGION" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "ap-southeast-5"
}

variable "AWS_ACCESS_KEY" {
  description = "AWS Acces Key"
  type        = string
  sensitive   = true
}

variable "AWS_SECRET_KEY" {
  description = "AWS Secret Key"
  type        = string
  sensitive   = true
}
