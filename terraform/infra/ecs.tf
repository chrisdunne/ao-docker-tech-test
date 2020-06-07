resource "aws_ecs_cluster" "ao-test-ecs-cluster" {
  name = "ao-test-ecs-cluster"
}

resource "aws_ecs_service" "ao-test-ecs-service" {
  name            = "ao-test-ecs-service"
  cluster         = aws_ecs_cluster.ao-test-ecs-cluster.arn
  task_definition = aws_ecs_task_definition.ao-test-ecs-task-def.arn
  desired_count   = 3
  iam_role        = "arn:aws:iam::148367607594:role/aws-service-role/ecs.amazonaws.com/AWSServiceRoleForECS"

  load_balancer {
    target_group_arn = aws_lb_target_group.ao-test-alb-tg-http.arn
    container_name   = "ao-test-ecs-container"
    container_port   = 80
  }
}

resource "aws_ecs_task_definition" "ao-test-ecs-task-def" {
  family                = "ao-test-ecs-task-def"
  container_definitions = file("../config/container-def.json")
  execution_role_arn    = "arn:aws:iam::148367607594:role/ecsTaskExecutionRole"
}