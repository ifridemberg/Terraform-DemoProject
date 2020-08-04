resource "aws_ecs_task_definition" "e2e-db" {
  family                = "e2e-Db"
  container_definitions = "${file("e2eDb_container.json")}"
  network_mode= "awsvpc"
  cpu= 256
  memory= 512
  tags= {}


}