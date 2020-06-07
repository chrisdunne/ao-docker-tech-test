resource "aws_vpc" "ao-test-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}

resource "aws_route_table" "ao-test-route-table" {
  vpc_id = aws_vpc.ao-test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ao-test-igw.id
  }
}