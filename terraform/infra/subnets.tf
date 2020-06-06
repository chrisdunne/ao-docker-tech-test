resource "aws_subnet" "ao-test-subnet1-a" {
  vpc_id     = aws_vpc.ao-test-vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_subnet" "ao-test-subnet-b" {
  vpc_id     = aws_vpc.ao-test-vpc.id
  cidr_block = "10.0.2.0/24"
}

resource "aws_subnet" "ao-test-subnet-c" {
  vpc_id     = aws_vpc.ao-test-vpc.id
  cidr_block = "10.0.3.0/24"
}