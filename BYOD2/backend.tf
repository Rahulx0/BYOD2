terraform {
  backend "s3" {
    bucket         = "rahul-terraform-state-bucket-1765443151"
    key            = "prod/webserver/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "rahul-terraform-lock-table"
    encrypt        = true
  }
}