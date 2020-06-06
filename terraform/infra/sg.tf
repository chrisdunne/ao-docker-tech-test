resource "aws_security_group" "ao-test-alb-sg" {
  name = "ao-test-alb-sg"
  vpc_id = aws_vpc.ao-test-vpc.id
  description = "security group for ao-test-alb"

  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ao-tech-alb-sg-rule-ingress-http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ao-test-alb-sg.id
}

resource "aws_security_group_rule" "ao-tech-alb-sg-rule-ingress-https" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ao-test-alb-sg.id
}

resource "aws_security_group_rule" "ao-tech-alb-sg-rule-egress-lc" {
  type              = "egress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.ao-test-alb-sg.id
  source_security_group_id = aws_security_group.ao-test-lc-sg.id
}

resource "aws_security_group" "ao-test-lc-sg" {
  name = "ao-test-lc-sg"
  vpc_id = aws_vpc.ao-test-vpc.id
  description = "security group for ao-test-lc instances"

  lifecycle {
      create_before_destroy = true
  }
}

resource "aws_security_group_rule" "ao-tech-lc-sg-rule-ingress-alb" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  security_group_id = aws_security_group.ao-test-lc-sg.id
  source_security_group_id = aws_security_group.ao-test-alb-sg.id
}

resource "aws_security_group_rule" "ao-tech-lc-sg-rule-egress-http" {
  type              = "egress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.ao-test-lc-sg.id
}

resource "aws_security_group_rule" "ao-tech-lc-sg-rule-egress-https" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks =  ["0.0.0.0/0"]
  security_group_id = aws_security_group.ao-test-lc-sg.id
}