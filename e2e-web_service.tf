resource "aws_ecs_service" "stg-e2e" {
  name            = "stge2eWeb"
  cluster         = "${aws_ecs_cluster.stg-e2e.id}"
  task_definition = "${aws_ecs_task_definition.e2e-web.id}"
  desired_count   = 3
  iam_role        = "AWSServiceRoleForECS"
  scheduling_strategy= "REPLICA"
  # depends_on      = ["aws_iam_role_policy.foo"]  
  # propagate_tags= "${aws_ecs_task_definition.e2e-web}"
 # platform_version= "" # For Fargate launch type

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

  load_balancer {
    target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:307633370395:targetgroup/e2e-container/e417030185be9fc7"
    container_name   = "e2e-web"
    elb_name = "e2ePythonApp"
    container_port   = 80
  }

  placement_constraints {
      type="memberOf"          
      }
}