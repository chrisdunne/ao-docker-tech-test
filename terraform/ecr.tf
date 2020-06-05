resource "aws_ecr_repository" "ao-test-app" {
  name                 = "ao-test-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}