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
}