################################################################################
## shared
################################################################################
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


variable "broker_type" {
  description = "Specify the broker type: RabbitMQ or ActiveMQ"
  type        = string
  default     = "RabbitMQ"
}

variable "broker_name" {
  description = "Name of the RabbitMQ broker."
  type        = string
}

variable "engine_version" {
  description = "Version of the RabbitMQ engine."
  type        = string
  default     = "3.8.26"
}

variable "host_instance_type" {
  description = "Instance type for the RabbitMQ broker."
  type        = string
  default     = "mq.t3.micro"
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RabbitMQ broker."
  type        = list(string)
  default     = []
}

variable "publicly_accessible" {
  description = "Whether the RabbitMQ broker is publicly accessible."
  type        = bool
  default     = false
}

variable "deployment_mode" {
  description = "Deployment mode for the RabbitMQ broker."
  type        = string
  default     = "SINGLE_INSTANCE"
}

variable "storage_type" {
  description = "Storage type for the RabbitMQ broker."
  type        = string
  default     = "ebs"
}

variable "apply_immediately" {
  description = "Whether changes should be applied immediately."
  type        = bool
  default     = true
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "enable_logging" {
  description = "Enable general logging for the RabbitMQ broker."
  type        = bool
  default     = false
}

variable "use_aws_owned_key" {
  description = "Use AWS-owned KMS CMK for encryption."
  type        = bool
  default     = true
}


variable "ingress_rules" {
  description = "A list of ingress rules for the security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
}

variable "egress_rules" {
  description = "A list of egress rules for the security group."
  type = list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
  default = []
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
