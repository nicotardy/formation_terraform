variable "root_cidr" {
  # default = "172.23"
  type        = "string"
  description = "root subnet"
}

variable "azs" {
  type    = "list"
  default = ["eu-west-1a", "eu-west-1b"]
}

variable "subnets" {
  type    = "list"
  default = ["subnet1", "subnet2"]
}
