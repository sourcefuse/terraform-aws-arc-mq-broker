# terraform-aws-module-template example

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_mq_broker"></a> [mq\_broker](#module\_mq\_broker) | ../ | n/a |
| <a name="module_tags"></a> [tags](#module\_tags) | sourcefuse/arc-tags/aws | 1.2.6 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Whether changes should be applied immediately. | `bool` | `true` | no |
| <a name="input_broker_name"></a> [broker\_name](#input\_broker\_name) | Name of the RabbitMQ broker. | `string` | n/a | yes |
| <a name="input_broker_type"></a> [broker\_type](#input\_broker\_type) | Specify the broker type: RabbitMQ or ActiveMQ | `string` | `"RabbitMQ"` | no |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | Deployment mode for the RabbitMQ broker. | `string` | `"SINGLE_INSTANCE"` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | A list of egress rules for the security group. | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable general logging for the RabbitMQ broker. | `bool` | `false` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version of the RabbitMQ engine. | `string` | `"3.8.26"` | no |
| <a name="input_host_instance_type"></a> [host\_instance\_type](#input\_host\_instance\_type) | Instance type for the RabbitMQ broker. | `string` | `"mq.t3.micro"` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | A list of ingress rules for the security group. | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Whether the RabbitMQ broker is publicly accessible. | `bool` | `false` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the security group | `string` | n/a | yes |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type for the RabbitMQ broker. | `string` | `"ebs"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the RabbitMQ broker. | `list(string)` | `[]` | no |
| <a name="input_use_aws_owned_key"></a> [use\_aws\_owned\_key](#input\_use\_aws\_owned\_key) | Use AWS-owned KMS CMK for encryption. | `bool` | `true` | no |
| <a name="input_users"></a> [users](#input\_users) | List of users for the ActiveMQ broker | <pre>object({<br>    username = optional(string)<br>    groups   = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_users_replica"></a> [users\_replica](#input\_users\_replica) | List of users for the ActiveMQ broker | <pre>object({<br>    replication_username = optional(string)<br>    groups               = optional(list(string), [])<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activemq_broker_id"></a> [activemq\_broker\_id](#output\_activemq\_broker\_id) | The ID of the ActiveMQ broker (if broker\_type is ActiveMQ). |
| <a name="output_rabbitmq_broker_id"></a> [rabbitmq\_broker\_id](#output\_rabbitmq\_broker\_id) | The ID of the RabbitMQ broker (if broker\_type is RabbitMQ). |
| <a name="output_rabbitmq_user_password_ssm_parameter"></a> [rabbitmq\_user\_password\_ssm\_parameter](#output\_rabbitmq\_user\_password\_ssm\_parameter) | The SSM parameter name storing the RabbitMQ user password. |
| <a name="output_rabbitmq_user_ssm_parameter"></a> [rabbitmq\_user\_ssm\_parameter](#output\_rabbitmq\_user\_ssm\_parameter) | The SSM parameter name storing the RabbitMQ username. |
| <a name="output_replication_user_password_ssm_parameter"></a> [replication\_user\_password\_ssm\_parameter](#output\_replication\_user\_password\_ssm\_parameter) | The SSM parameter name storing the replication user password (ActiveMQ only). |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the security group created for the MQ broker. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
