resource "aws_ecs_cluster" "ao-test-ecs-cluster" {
  name = "ao-test-ecs-cluster"
}

resource "aws_ecs_service" "ao-test-ecs-service" {
  name            = "ao-test-ecs-service"
  cluster         = aws_ecs_cluster.ao-test-ecs-cluster.arn
  task_definition = aws_ecs_task_definition.ao-test-ecs-task-def.arn
  desired_count   = 3
}

resource "aws_ecs_task_definition" "ao-test-ecs-task-def" {
  family                = "ao-test-ecs-task-def"
  container_definitions = file("../../config/container-def.json")
}