resource "aws_security_group" "elb_sec_group" {
  name        = "ELb Security Group"
  description = "Security Group rules for Jenkins server"
  vpc_id      = "vpc-0ecf95df5a664097d"

  ingress {
    # Jenkins port
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # add a CIDR block here
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
    prefix_list_ids = ["pl-12c4e678"]
  }
}