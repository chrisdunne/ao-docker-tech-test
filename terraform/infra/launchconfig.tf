resource "aws_launch_configuration" "ao-test-lc" {
  name          = "ao-test-lc"
  image_id      = data.aws_ami.ao-test-ami.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.ao-test-lc-sg.id]

  lifecycle {
    create_before_destroy = true
  }
}

data "aws_ami" "ao-test-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}