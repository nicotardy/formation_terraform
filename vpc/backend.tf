terraform {
  backend "s3" {
    bucket = "lab-nta-tfstate-bucket"
    key    = "vpc/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "terraform_state_lock"
  }
}
