resource "aws_ecs_task_definition" "e2e-web" {
  family                = "e2e-web"
  container_definitions = "${file("e2eweb_container.json")}"
  network_mode= "awsvpc"
  cpu= 256
  memory= 512
  tags= {}


}