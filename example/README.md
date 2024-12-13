# terraform-aws-module-template example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.80.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mq_broker"></a> [mq\_broker](#module\_mq\_broker) | ../ | n/a |
| <a name="module_tags"></a> [tags](#module\_tags) | sourcefuse/arc-tags/aws | 1.2.6 |

## Resources

| Name | Type |
|------|------|
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_broker_type"></a> [broker\_type](#input\_broker\_type) | Specify the broker type: RabbitMQ or ActiveMQ | `string` | `"RabbitMQ"` | no |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | Deployment mode for the RabbitMQ or ActiveMQ broker. | `string` | `"SINGLE_INSTANCE"` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable general logging for the RabbitMQ or ActiveMQ broker. | `bool` | `false` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version of the RabbitMQ or ActiveMQ engine. | `string` | `"3.8.26"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment, i.e. dev, stage, prod | `string` | `"dev"` | no |
| <a name="input_host_instance_type"></a> [host\_instance\_type](#input\_host\_instance\_type) | Instance type for the RabbitMQ or ActiveMQ broker. | `string` | `"mq.t3.micro"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the RabbitMQ or ActiveMQ broker. | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace of the project, i.e. arc | `string` | `"arc"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Whether the RabbitMQ or ActiveMQ broker is publicly accessible. | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type for the RabbitMQ or ActiveMQ broker. | `string` | `"ebs"` | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | List of subnet names to lookup | `list(string)` | <pre>[<br>  "arc-poc-private-subnet-private-us-east-1a",<br>  "arc-poc-private-subnet-private-us-east-1b"<br>]</pre> | no |
| <a name="input_users"></a> [users](#input\_users) | List of users for the ActiveMQ broker | <pre>object({<br>    username = optional(string)<br>    groups   = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_users_replica"></a> [users\_replica](#input\_users\_replica) | List of users for the ActiveMQ broker | <pre>object({<br>    replication_username = optional(string)<br>    groups               = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC to add the resources | `string` | `"arc-poc-vpc"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_broker_id"></a> [broker\_id](#output\_broker\_id) | The ID of the MQ broker (RabbitMQ or ActiveMQ) based on the broker type. |
| <a name="output_rabbitmq_user_password_ssm_parameter"></a> [rabbitmq\_user\_password\_ssm\_parameter](#output\_rabbitmq\_user\_password\_ssm\_parameter) | The SSM parameter name storing the RabbitMQ user password. |
| <a name="output_rabbitmq_user_ssm_parameter"></a> [rabbitmq\_user\_ssm\_parameter](#output\_rabbitmq\_user\_ssm\_parameter) | The SSM parameter name storing the RabbitMQ username. |
| <a name="output_replication_user_password_ssm_parameter"></a> [replication\_user\_password\_ssm\_parameter](#output\_replication\_user\_password\_ssm\_parameter) | The SSM parameter name storing the replication user password (ActiveMQ only). |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group created for the MQ broker. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
