provider "aws" {
    region = var.region
}
terraform {
  backend "s3" {
    bucket = "sumathi-terraform-todoapp-bucket-s3"
    key    = "terraform_todoapp-tfstate"
    region = "ap-south-1"
    dynamodb_table = "sumathi-todoapp-tf-lock-table"
  }
}
