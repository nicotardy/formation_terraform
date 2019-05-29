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

resource "aws_subnet" "subnet" {
  count             = 2
  availability_zone = "${element(var.azs, count.index)}"

  vpc_id     = "${aws_vpc.lab_nta.id}"
  cidr_block = "${var.root_cidr}.${element(var.subnets_ip, count.index)}/24"

  tags = {
    Name = "lab_nta"
    Name = "subnet-${count.index}"
  }
}

resource "aws_route_table_association" "subnet_rt_assoc" {
  count = 2

  subnet_id      = "${element(aws_subnet.subnet.*.id, count.index)}"
  route_table_id = "${aws_route_table.subnet_rt.id}"

  /*
  tags = {
    Name = "lab_nta"
    Name = "subnet_rt_assoc-${count.index}"
  }
*/
}

resource "aws_route_table" "subnet_rt" {
  vpc_id = "${aws_vpc.lab_nta.id}"

  tags = {
    Name = "lab_nta"
    Name = "rt"
  }
}

resource "aws_route" "subnet_rt_igw" {
  route_table_id         = "${aws_route_table.subnet_rt.id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.igw.id}"
}

resource "local_file" "myfile" {
  content  = "hello Nico !"
  filename = "${var.input_filename}"
}
