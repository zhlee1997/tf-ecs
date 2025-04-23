terraform {
  backend "s3" {
    bucket  = "my-terraform-state-bucket-ecs-fargate"
    region  = "us-east-1"
    key     = "ecs-fargate-demo/terraform.tfstate"
    encrypt = true
  }

  required_version = ">=0.13.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}
