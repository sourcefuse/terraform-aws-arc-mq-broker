# terraform-aws-arc-mq-broker

## Overview

This Terraform module provides an easy and scalable way to deploy and manage Amazon MQ brokers. It supports various deployment options and configurations, including engine types (ActiveMQ and RabbitMQ), instance classes, storage types, and security settings. The module simplifies the setup of brokers for message-oriented middleware with high availability and fault tolerance.

## Usage

See the `example` folder for a working module example.  

```hcl
################################################################################
## RabbitMQ
################################################################################
module "mq_broker" {
  source              = "../"
  broker_name         = var.broker_name
  broker_type         = var.broker_type
  engine_version      = var.engine_version
  host_instance_type  = var.host_instance_type
  subnet_ids          = var.subnet_ids
  security_group_name = var.security_group_name
  deployment_mode     = var.deployment_mode
  users               = var.users
  enable_logging      = var.enable_logging
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
  tags                = module.tags.tags

}

################################################################################
## Apache ActiveMQ
################################################################################
module "mq_broker" {
  source              = "../"
  broker_name         = var.broker_name
  broker_type         = var.broker_type
  engine_version      = var.engine_version
  host_instance_type  = var.host_instance_type
  subnet_ids          = var.subnet_ids
  storage_type        = var.storage_type
  security_group_name = var.security_group_name
  deployment_mode     = var.deployment_mode
  users_replica       = var.users_replica
  users               = var.users
  enable_logging      = var.enable_logging
  ingress_rules       = var.ingress_rules
  egress_rules        = var.egress_rules
  tags                = module.tags.tags

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.80.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.3 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_mq_broker.active-mq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker) | resource |
| [aws_mq_broker.rabbit-mq](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/mq_broker) | resource |
| [aws_security_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ssm_parameter.replication_user](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.replication_user_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.user_name](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [aws_ssm_parameter.user_password](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssm_parameter) | resource |
| [random_password.rabbitmq_user_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Whether changes should be applied immediately. | `bool` | `true` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Indicates whether minor engine upgrades are applied automatically to the instance during the maintenance window. | `bool` | `true` | no |
| <a name="input_broker_name"></a> [broker\_name](#input\_broker\_name) | Name of the RabbitMQ broker. | `string` | n/a | yes |
| <a name="input_broker_type"></a> [broker\_type](#input\_broker\_type) | Specify the broker type: RabbitMQ or ActiveMQ | `string` | `"RabbitMQ"` | no |
| <a name="input_data_replication_primary_broker_arn"></a> [data\_replication\_primary\_broker\_arn](#input\_data\_replication\_primary\_broker\_arn) | The ARN of the primary broker for data replication | `string` | `""` | no |
| <a name="input_deployment_mode"></a> [deployment\_mode](#input\_deployment\_mode) | Deployment mode for the RabbitMQ broker. | `string` | `"SINGLE_INSTANCE"` | no |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | A list of egress rules for the security group. | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_enable_data_replication"></a> [enable\_data\_replication](#input\_enable\_data\_replication) | Enable or disable data replication for the broker | `bool` | `false` | no |
| <a name="input_enable_logging"></a> [enable\_logging](#input\_enable\_logging) | Enable general logging for the RabbitMQ broker. | `bool` | `false` | no |
| <a name="input_encryption_options"></a> [encryption\_options](#input\_encryption\_options) | Encryption options for the resource. | <pre>object({<br>    use_aws_owned_key = bool<br>    kms_key_id        = string<br>  })</pre> | <pre>{<br>  "kms_key_id": null,<br>  "use_aws_owned_key": true<br>}</pre> | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version of the RabbitMQ engine. | `string` | `"3.8.26"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Name of the environment, i.e. dev, stage, prod | `string` | `"dev"` | no |
| <a name="input_host_instance_type"></a> [host\_instance\_type](#input\_host\_instance\_type) | Instance type for the RabbitMQ broker. | `string` | `"mq.t3.micro"` | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | A list of ingress rules for the security group. | <pre>list(object({<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_ldap_config"></a> [ldap\_config](#input\_ldap\_config) | Configuration for LDAP server | <pre>object({<br>    required                 = bool<br>    hosts                    = list(string)<br>    role_base                = string<br>    role_name                = string<br>    role_search_matching     = string<br>    role_search_subtree      = bool<br>    service_account_password = string<br>    service_account_username = string<br>    user_base                = string<br>    user_role_name           = string<br>    user_search_matching     = string<br>    user_search_subtree      = bool<br>  })</pre> | <pre>{<br>  "hosts": [],<br>  "required": false,<br>  "role_base": "",<br>  "role_name": "",<br>  "role_search_matching": "",<br>  "role_search_subtree": false,<br>  "service_account_password": "",<br>  "service_account_username": "",<br>  "user_base": "",<br>  "user_role_name": "",<br>  "user_search_matching": "",<br>  "user_search_subtree": false<br>}</pre> | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Maintenance window configuration including day, time, and time zone. | <pre>object({<br>    day_of_week = string<br>    time_of_day = string<br>    time_zone   = string<br>  })</pre> | <pre>{<br>  "day_of_week": "MONDAY",<br>  "time_of_day": "02:00",<br>  "time_zone": "UTC"<br>}</pre> | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | Namespace of the project, i.e. arc | `string` | `"arc"` | no |
| <a name="input_publicly_accessible"></a> [publicly\_accessible](#input\_publicly\_accessible) | Whether the RabbitMQ broker is publicly accessible. | `bool` | `false` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | The name of the security group | `string` | n/a | yes |
| <a name="input_storage_type"></a> [storage\_type](#input\_storage\_type) | Storage type for the RabbitMQ broker. | `string` | `"ebs"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the RabbitMQ broker. | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to apply to resources | `map(string)` | n/a | yes |
| <a name="input_users"></a> [users](#input\_users) | List of users for the ActiveMQ broker | <pre>object({<br>    username = optional(string)<br>    groups   = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_users_replica"></a> [users\_replica](#input\_users\_replica) | List of users for the ActiveMQ broker | <pre>object({<br>    replication_username = optional(string)<br>    groups               = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | The VPC ID for the VPC endpoint. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_activemq_broker_id"></a> [activemq\_broker\_id](#output\_activemq\_broker\_id) | The ID of the ActiveMQ broker. |
| <a name="output_broker_mq_user_password_ssm_parameter"></a> [broker\_mq\_user\_password\_ssm\_parameter](#output\_broker\_mq\_user\_password\_ssm\_parameter) | The SSM parameter storing the brokerMQ user password. |
| <a name="output_broker_mq_user_ssm_parameter"></a> [broker\_mq\_user\_ssm\_parameter](#output\_broker\_mq\_user\_ssm\_parameter) | The SSM parameter storing the brokerMQ username. |
| <a name="output_rabbitmq_broker_id"></a> [rabbitmq\_broker\_id](#output\_rabbitmq\_broker\_id) | The ID of the RabbitMQ broker. |
| <a name="output_replication_user_password_ssm_parameter"></a> [replication\_user\_password\_ssm\_parameter](#output\_replication\_user\_password\_ssm\_parameter) | The SSM parameter storing the replication user password for ActiveMQ. |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the created security group for brokerMQ. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Versioning  
This project uses a `.version` file at the root of the repo which the pipeline reads from and does a git tag.  

When you intend to commit to `main`, you will need to increment this version. Once the project is merged,
the pipeline will kick off and tag the latest git commit.  

## Development

### Prerequisites

- [terraform](https://learn.hashicorp.com/terraform/getting-started/install#installing-terraform)
- [terraform-docs](https://github.com/segmentio/terraform-docs)
- [pre-commit](https://pre-commit.com/#install)
- [golang](https://golang.org/doc/install#install)
- [golint](https://github.com/golang/lint#installation)

### Configurations

- Configure pre-commit hooks
  ```sh
  pre-commit install
  ```

### Versioning

while Contributing or doing git commit please specify the breaking change in your commit message whether its major,minor or patch

For Example

```sh
git commit -m "your commit message #major"
```
By specifying this , it will bump the version and if you don't specify this in your commit message then by default it will consider patch and will bump that accordingly

### Tests
- Tests are available in `test` directory
- Configure the dependencies
  ```sh
  cd test/
  go mod init github.com/sourcefuse/terraform-aws-refarch-<module_name>
  go get github.com/gruntwork-io/terratest/modules/terraform
  ```
- Now execute the test  
  ```sh
  go test -timeout  30m
  ```

## Authors

This project is authored by:
- SourceFuse ARC Team
