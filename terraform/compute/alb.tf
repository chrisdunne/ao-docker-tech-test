#resource "aws_lb" "ao-test-lb" {
#  name               = "ao-test-lb"
#  internal           = false
#  load_balancer_type = "application"
#  security_groups    = ["${aws_security_group.lb_sg.id}"]
#  subnets            = ["${aws_subnet.public.*.id}"]
#}