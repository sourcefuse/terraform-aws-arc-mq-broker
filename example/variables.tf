################################################################################
## shared
################################################################################
variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

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

variable "subnet_names" {
  type        = list(string)
  description = "List of subnet names to lookup"
  default     = ["arc-poc-private-subnet-private-us-east-1a", "arc-poc-private-subnet-private-us-east-1b"]
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC to add the resources"
  default     = "arc-poc-vpc"
}

variable "broker_type" {
  description = "Specify the broker type: RabbitMQ or ActiveMQ"
  type        = string
  default     = "RabbitMQ"
}

variable "broker_name" {
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
  description = "Storage type for the RabbitMQ or ActiveMQ broker."
  type        = string
  default     = "ebs"
}

variable "security_group_name" {
  description = "The name of the security group"
  type        = string
}

variable "enable_logging" {
  description = "Enable general logging for the RabbitMQ or ActiveMQ broker."
  type        = bool
  default     = false
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
