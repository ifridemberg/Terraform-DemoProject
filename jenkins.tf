resource "aws_instance" "stg-jenkins" {
  ami                      = "ami-08b314ce48a790a19"
  instance_type            = "t2.small"
  key_name                =  "jenkins"
  vpc_security_group_ids  = ["${aws_security_group.sec_group.id}"]
  availability_zone        = "us-east-1a"
  subnet_id                = "subnet-4cc32301"

root_block_device {
  volume_type           = "gp2"
  volume_size           = 40
  delete_on_termination = false
}

tags  = {
  Name   = "jenkins"

}
# provisioner "local-exec" {
#   command = "/bin/sh scripts/jenkins_setup.sh"
# }

}
