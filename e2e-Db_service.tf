resource "aws_ecs_service" "stg-db" {
  name            = "stge2eDb"
  cluster         = "${aws_ecs_cluster.stg-e2e.id}"
  task_definition = "${aws_ecs_task_definition.e2e-web.id}"
  desired_count   = 3
  iam_role        = "AWSServiceRoleForECS"
  scheduling_strategy= "REPLICA"

  service_registries {
                    container_name= ""
                    container_port= 0
                    port= 0
                    registry_arn= "arn:aws:servicediscovery:us-east-1:307633370395:service/srv-gzypjrgvawm4atks"
  }      

  ordered_placement_strategy {
    type  = "spread"
    field = "attribute:ecs.availability-zone"
  }

  placement_constraints {
      type="memberOf"          
      }
}