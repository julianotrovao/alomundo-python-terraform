# Cluster ECS
resource "aws_ecs_cluster" "main" {
  name = "alo-mundo-cluster"
}

# Task Definition com Log Group
resource "aws_ecs_task_definition" "app" {
  family                   = "alo-mundo-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  container_definitions = jsonencode([{
    name  = "flask-app"
    image = "017121235801.dkr.ecr.us-east-1.amazonaws.com/alo-mundo:latest"
    portMappings = [{ containerPort = 5000 }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        "awslogs-group"         = "/ecs/alo-mundo"
        "awslogs-region"        = "us-east-1"
        "awslogs-stream-prefix" = "ecs"
      }
    }
  }])
}
