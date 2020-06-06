resource "aws_subnet" "ao-test-subnet-a" {
  vpc_id     = aws_vpc.ao-test-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
}

resource "aws_subnet" "ao-test-subnet-b" {
  vpc_id     = aws_vpc.ao-test-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2b"
}

resource "aws_subnet" "ao-test-subnet-c" {
  vpc_id     = aws_vpc.ao-test-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-2c"
}