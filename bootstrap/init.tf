provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_backend" {
  bucket = "lab-nta-tfstate-bucket"
  acl    = "private"
}
