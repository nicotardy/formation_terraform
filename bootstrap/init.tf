provider "aws" {
  region = "eu-west-1"
}

resource "aws_s3_bucket" "terraform_backend" {
  bucket = "lab-nta-tfstate-bucket"
  acl    = "private"
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name = "foo"

  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
