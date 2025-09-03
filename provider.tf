provider "aws" {
  region  = "ap-south-1"
  profile = "terraform-user2"
}

# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "5.85.0"
#     }
#   }

#   # backend "s3" {
#   #   bucket  = "prathameshbews3bucket"
#   #   key     = "terraform/tfstate/terraform.tfstate"
#   #   region  = "ap-south-1"
#   #   encrypt = true
#   # }
# }
