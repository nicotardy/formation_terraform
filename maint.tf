provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "lab_nta" {
  cidr_block = "${var.root_cidr}.0.0/16"

  tags = {
    Name = "lab_nta"
    Name = "vpc"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.lab_nta.id}"

  tags = {
    Name = "lab_nta"
    Name = "igw"
  }
}

/*
resource "aws_subnet" "priv_sbnt1" {
  vpc_id     = "${aws_vpc.lab_nta.id}"
  cidr_block = "${var.root_cidr}.1.0/24"

  tags = {
    Name = "lab_nta"
    Name = "sbnt"
    Name = "priv"
  }
}
*/

resource "aws_subnet" "pub_sbnt1" {
  vpc_id     = "${aws_vpc.lab_nta.id}"
  cidr_block = "${var.root_cidr}.2.0/24"

  tags = {
    Name = "lab_nta"
    Name = "sbnt"
    Name = "pub"
  }
}

resource "aws_route_table_association" "pub_sbnt1_rt_assoc" {
  subnet_id      = "${aws_subnet.pub_sbnt1.id}"
  route_table_id = "${aws_route_table.pub_sbnt1_rt.id}"
}

resource "aws_route_table" "pub_sbnt1_rt" {
  vpc_id = "${aws_vpc.lab_nta.id}"

  tags = {
    Name = "lab_nta"
    Name = "rt"
  }
}

resource "aws_route" "pub_sbnt1_rt_igw" {
  route_table_id         = "${aws_route_table.pub_sbnt1_rt.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "local_file" "myfile" {
  content  = "hello Nico !"
  filename = "${var.input_filename}"
}
