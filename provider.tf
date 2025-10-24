terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

# Global provider for CloudFront (must be us-east-1)
provider "aws" {
  alias  = "global"
  region = "us-east-1"
}

# Default provider for regional resources (ALB, API Gateway, etc.)
provider "aws" {
  region = "us-east-1"   # Change if your ALB is in a different region
}
