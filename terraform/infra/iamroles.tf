resource "aws_iam_role" "ao-test-ecs-instance-role" {
  name = "ecsInstanceRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ao-test-ecs-instance-policy-attachment" {
  role       = aws_iam_role.ao-test-ecs-instance-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"
}

resource "aws_iam_role_policy_attachment" "ao-test-ecs-access-policy-attachment" {
  role = aws_iam_role.ao-test-ecs-instance-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonECS_FullAccess"
}

resource "aws_iam_instance_profile" "ao-test-instance-profile-ecs-instance-role" {
  name = "ecsInstanceRole"
  role = aws_iam_role.ao-test-ecs-instance-role.name
}

resource "aws_iam_role" "ao-test-ecs-task-role" {
  name = "ecsTaskExecutionRole"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ao-test-ecs-task-exec-policy-attachment" {
  role = aws_iam_role.ao-test-ecs-task-role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}