data "aws_ami" "rhel" {
  most_recent = true
  owners = [ "309956199498" ]

  /*filter {
    name = "name"
    values = [ "amazon/RHEL-9.*-x86_64-*" ]
  }
  */
}

resource "aws_instance" "jenkins" {
    ami = data.aws_ami.rhel.id 
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    key_name = var.key_name
    # security_groups = var.security_groups (causing forced replacements)
    vpc_security_group_ids = var.security_groups
    tags = {
      Name = "${var.instance_name}"
    }
    provisioner "local-exec" {
      command = "aws ec2 wait instance-status-ok --instance-ids ${aws_instance.jenkins.id}"
    }
}

