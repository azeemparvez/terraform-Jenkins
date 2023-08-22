output "instance_id" {
    value = aws_instance.jenkins.id
}

output "name_instance" {
    value = "${var.instance_name}"
}

output "public_ip" {
    value = "${aws_instance.jenkins.public_ip}"
  
}