resource "aws_lb" "ao-test-alb" {
  name               = "ao-test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ao-test-alb-sg.id]
  subnets            = [aws_subnet.ao-test-subnet-a.id, aws_subnet.ao-test-subnet-b.id, aws_subnet.ao-test-subnet-c.id]
}

resource "aws_lb_listener" "ao-test-alb-listener-http" {
  load_balancer_arn = aws_lb.ao-test-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ao-test-alb-tg-http.arn
  }
}

#resource "aws_lb_listener" "ao-test-alb-listener-https" {
#  load_balancer_arn = aws_lb.ao-test-alb.arn
#  port              = "443"
#  protocol          = "HTTPS"
#
#  default_action {
#    type             = "forward"
#    target_group_arn = aws_lb_target_group.ao-test-alb-tg-https.arn
#  }
#}
#
#resource "aws_lb_listener_certificate" "ao-test-alb-listener-cert" {
#  listener_arn    = aws_lb_listener.ao-test-alb-listener-https.arn
#  certificate_arn = ""
#}