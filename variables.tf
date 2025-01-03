
variable "environment" {
  type        = string
  description = "Name of the environment, i.e. dev, stage, prod"
  default     = "dev"
}

variable "namespace" {
  type        = string
  default     = "arc"
  description = "Namespace of the project, i.e. arc"
}

variable "broker_type" {
  description = "Specify the broker type: RabbitMQ or ActiveMQ"
  type        = string
  default     = "RabbitMQ"
}

variable "name" {
  description = "Name of the RabbitMQ or ActiveMQ broker."
  type        = string
}

variable "engine_version" {
  description = "Version of the RabbitMQ or ActiveMQ engine."
  type        = string
  default     = "3.8.26"
}

variable "host_instance_type" {
  description = "Instance type for the RabbitMQ or ActiveMQ broker."
  type        = string
  default     = "mq.t3.micro"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RabbitMQ or ActiveMQ broker."
  type        = list(string)
  default     = []
}

variable "publicly_accessible" {
  description = "Whether the RabbitMQ or ActiveMQ broker is publicly accessible."
  type        = bool
  default     = false
}

variable "deployment_mode" {
  description = "Deployment mode for the RabbitMQ or ActiveMQ broker."
  type        = string
  default     = "SINGLE_INSTANCE"
}

variable "storage_type" {
  description = "Storage type for the RabbitMQ or ActiveMQ or ActiveMQ broker."
  type        = string
  default     = "ebs"
}

variable "apply_immediately" {
  description = "Whether changes should be applied immediately."
  type        = bool
  default     = true
}

variable "users" {
  description = "List of users for the ActiveMQ broker"
  type = object({
    username = optional(string)
    groups   = optional(list(string), [])
  })
  default = {}
}

variable "users_replica" {
  description = "List of users for the ActiveMQ broker"
  type = object({
    replication_username = optional(string)
    groups               = optional(list(string), [])
  })
  default = {}
}

variable "enable_logging" {
  description = "Enable general logging for the RabbitMQ broker."
  type        = bool
  default     = false
}

variable "auto_minor_version_upgrade" {
  description = "Indicates whether minor engine upgrades are applied automatically to the instance during the maintenance window."
  type        = bool
  default     = true
}

variable "encryption_options" {
  description = "Encryption options for the resource."
  type = object({
    use_aws_owned_key = bool
    kms_key_id        = string
  })
  default = {
    use_aws_owned_key = true
    kms_key_id        = null
  }
}

variable "maintenance_window" {
  description = "Maintenance window configuration including day, time, and time zone."
  type = object({
    day_of_week = string
    time_of_day = string
    time_zone   = string
  })
  default = {
    day_of_week = "MONDAY"
    time_of_day = "02:00"
    time_zone   = "UTC"
  }
}

variable "vpc_id" {
  description = "The VPC ID for the VPC endpoint."
  type        = string
  default     = null
}

variable "security_group_data" {
  type = object({
    security_group_ids_to_attach = optional(list(string), [])
    create                       = optional(bool, true)
    description                  = optional(string, null)
    ingress_rules = optional(list(object({
      description              = optional(string, null)
      cidr_block               = optional(string, null)
      source_security_group_id = optional(string, null)
      from_port                = number
      ip_protocol              = string
      to_port                  = string
      self                     = optional(bool, false)
    })), [])
    egress_rules = optional(list(object({
      description                   = optional(string, null)
      cidr_block                    = optional(string, null)
      destination_security_group_id = optional(string, null)
      from_port                     = number
      ip_protocol                   = string
      to_port                       = string
      prefix_list_id                = optional(string, null)
    })), [])
  })
  description = "(optional) Security Group data"
  default = {
    create = false
  }
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "ldap_config" {
  description = "Configuration for LDAP server"
  type = object({
    required                 = bool
    hosts                    = list(string)
    role_base                = string
    role_name                = string
    role_search_matching     = string
    role_search_subtree      = bool
    service_account_password = string
    service_account_username = string
    user_base                = string
    user_role_name           = string
    user_search_matching     = string
    user_search_subtree      = bool
  })
  default = {
    required                 = false
    hosts                    = []
    role_base                = ""
    role_name                = ""
    role_search_matching     = ""
    role_search_subtree      = false
    service_account_password = ""
    service_account_username = ""
    user_base                = ""
    user_role_name           = ""
    user_search_matching     = ""
    user_search_subtree      = false
  }
}

variable "enable_data_replication" {
  description = "Enable or disable data replication for the broker"
  type        = bool
  default     = false
}

variable "data_replication_primary_broker_arn" {
  description = "The ARN of the primary broker for data replication"
  type        = string
  default     = ""
}
