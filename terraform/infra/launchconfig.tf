resource "aws_launch_configuration" "ao-test-lc" {
  image_id      = data.aws_ami.ao-test-ami.id
  instance_type = "t2.micro"
  security_groups = [aws_security_group.ao-test-lc-sg.id]
  key_name        = "ao-test-keypair"
  iam_instance_profile = "ecsInstanceRole"

  lifecycle {
    create_before_destroy = true
  }

  user_data = file("../../config/user_data.sh")
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
    values = ["amzn-ami-*.l-amazon-ecs-optimized"]
  }
}