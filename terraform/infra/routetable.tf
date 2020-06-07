resource "aws_main_route_table_association" "a" {
  vpc_id         = aws_vpc.ao-test-vpc.id
  route_table_id = aws_route_table.ao-test-route-table.id
}

resource "aws_route_table" "ao-test-route-table" {
  vpc_id = aws_vpc.ao-test-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ao-test-igw.id
  }
}

resource "aws_route_table_association" "aws-route-associate-subnet-a" {
  subnet_id      = aws_subnet.ao-test-subnet-a.id
  route_table_id = aws_route_table.ao-test-route-table.id
}

resource "aws_route_table_association" "aws-route-associate-subnet-b" {
  subnet_id      = aws_subnet.ao-test-subnet-b.id
  route_table_id = aws_route_table.ao-test-route-table.id
}

resource "aws_route_table_association" "aws-route-associate-subnet-c" {
  subnet_id      = aws_subnet.ao-test-subnet-c.id
  route_table_id = aws_route_table.ao-test-route-table.id
}