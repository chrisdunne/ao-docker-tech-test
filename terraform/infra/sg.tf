resource "aws_security_group" "ao-test-sg" {
  name = "ao-test-sg"
  vpc_id = aws_vpc.ao-test-vpc.id
  description = "security group for ao-test-instance instances"

  ingress {
    description = "http"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.ao-test-vpc.cidr_block]
  }

  ingress {
    description = "https"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.ao-test-vpc.cidr_block]
  }

  lifecycle {
      create_before_destroy = true
  }
}