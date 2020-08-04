resource "aws_security_group" "sec_group" {
  name        = "jenkins Security Rules"
  description = "Security Group rules on Ubuntu 18.04"
  vpc_id      = "vpc-a0c3aeda"

  tags = {
     Name = "Jenkins"
  }

  ingress {
    # Jenkins port
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["181.117.120.24/32"]  # add a CIDR block here
  }
    ingress {
    # Ssh port
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks =  ["181.117.120.24/32"]  # add a CIDR block here
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
 #   prefix_list_ids = ["pl-12c4e678"]
  }
}