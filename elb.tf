resource "aws_lb" "e2ePythonApp" {
  name                        = "e2ePythonApp"
  internal                    = false
  load_balancer_type          = "application"
  security_groups             = ["${aws_security_group.elb_sec_group.id}"]
  subnets                     = ["subnet-4cc32301"]

  enable_deletion_protection = true

  tags = {
    Name = "e2ePythonApp"
  }
}



resource "aws_lb_listener" "e2e_listener" {
  load_balancer_arn = "${aws_lb.e2ePythonApp.arn}"
  port              = "80"
  protocol          = "HTTP"
 # ssl_policy        = "ELBSecurityPolicy-2016-08"
 # certificate_arn   = "arn:aws:iam::187416307283:server-certificate/test_cert_rab3wuqwgja25ct3n4jdj2tzu4"

  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.e2eFrontend.arn}"
  }
}

resource "aws_lb_target_group" "e2eFrontend" {
  name     = "e2eFrontend"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-a0c3aeda"
}

