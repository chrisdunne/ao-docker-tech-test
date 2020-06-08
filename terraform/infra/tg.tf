resource "aws_lb_target_group" "ao-test-alb-tg-http" {
  name     = "ao-test-alb-tg-http"
  port     = 32768
  protocol = "HTTP"
  vpc_id   = aws_vpc.ao-test-vpc.id
}

#resource "aws_lb_target_group" "ao-test-alb-tg-https" {
#  name     = "ao-test-alb-tg-https"
#  port     = 443
#  protocol = "HTTPS"
#  vpc_id   = aws_vpc.ao-test-vpc.id
#}