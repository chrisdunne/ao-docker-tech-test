resource "aws_autoscaling_group" "ao-test-asg" {
  name                      = "ao-test-asg"
  max_size                  = 6
  min_size                  = 3
  health_check_grace_period = 300
  health_check_type         = "ELB"
  desired_capacity          = 3
  force_delete              = true
  launch_configuration      = aws_launch_configuration.ao-test-lc.name
  vpc_zone_identifier       = [aws_subnet.ao-test-subnet-a.id, aws_subnet.ao-test-subnet-b.id, aws_subnet.ao-test-subnet-c.id]
  target_group_arns         = [aws_lb_target_group.ao-test-alb-tg-http.arn]
}