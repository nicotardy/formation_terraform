output "filename" {
  value = "${local_file.myfile.filename}"
}

output "vpc_cidr" {
  value = "${aws_vpc.lab_nta.cidr_block}"
}

output "vpc_id" {
  value = "${aws_vpc.lab_nta.id}"
}

output "subnet_cidr" {
  value = "${aws_subnet.pub_sbnt1.cidr_block}"
}

output "subnet_id" {
  value = "${aws_subnet.pub_sbnt1.id}"
}
