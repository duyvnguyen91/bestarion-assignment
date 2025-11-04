terraform {
  backend "s3" {
    bucket         = "duynv-tfstate"
    key            = "prod/terraform.tfstate"
    region         = "ap-southeast-1"
    dynamodb_table = "duynv-lock-tfstate"
    encrypt        = true
  }
}