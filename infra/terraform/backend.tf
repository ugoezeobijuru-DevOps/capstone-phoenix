terraform {
  backend "s3" {
    bucket         = "capstone-phoenix-tfstate-144410074149"
    key            = "capstone/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "capstone-phoenix-tflock"
    encrypt        = true
  }
}
