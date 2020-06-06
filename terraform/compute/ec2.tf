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

resource "aws_instance" "ao-test-instance" {
  ami           = data.aws_ami.ao-test-ami.id
  instance_type = "t2.micro"
}