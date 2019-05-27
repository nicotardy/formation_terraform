resource "local_file" "myfile" {
  content  = "hello Nico !"
  filename = "${var.input_filename}"
}
