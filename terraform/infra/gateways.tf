resource "aws_internet_gateway" "ao-test-igw" {
  vpc_id = aws_vpc.ao-test-vpc.id
}