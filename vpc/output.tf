
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
  value = ["${aws_subnet.subnet.*.cidr_block}"]
}

output "subnet_id" {
  value = ["${aws_subnet.subnet.*.id}"]
}

output "subnet_arn" {
  value = ["${aws_subnet.subnet.*.arn}"]
}


output "rt_association" {
  value = ["${aws_route_table_association.subnet_rt_assoc.*.id}"]
}