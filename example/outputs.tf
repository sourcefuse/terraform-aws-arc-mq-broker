output "security_group_id" {
  description = "The ID of the security group created for the MQ broker."
  value       = module.mq_broker.security_group_id
}
output "rabbitmq_user_password_ssm_parameter" {
  description = "The SSM parameter name storing the RabbitMQ user password."
  value       = module.mq_broker.user_password_ssm_parameter
}

output "rabbitmq_user_ssm_parameter" {
  description = "The SSM parameter name storing the RabbitMQ username."
  value       = module.mq_broker.user_ssm_parameter
}

output "replication_user_password_ssm_parameter" {
  description = "The SSM parameter name storing the replication user password (ActiveMQ only)."
  value       = module.mq_broker.replication_user_password_ssm_parameter
}

output "broker_id" {
  description = "The ID of the MQ broker (RabbitMQ or ActiveMQ) based on the broker type."
  value       = module.mq_broker.broker_id
}
