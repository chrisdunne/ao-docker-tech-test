resource "aws_vpc" "ao-test-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
}