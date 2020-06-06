resource "aws_lb" "ao-test-alb" {
  name               = "ao-test-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.ao-test-sg.id]
  subnets            = [aws_subnet.ao-test-subnet-a.id, aws_subnet.ao-test-subnet-b.id, aws_subnet.ao-test-subnet-c.id]
}