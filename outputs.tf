output "security_group_id" {
  description = "The ID of the created security group for brokerMQ."
  value       = module.arc_security_group.id
}

output "user_password_ssm_parameter" {
  description = "The SSM parameter storing the brokerMQ user password."
  value       = aws_ssm_parameter.user_password.name
}

output "user_ssm_parameter" {
  description = "The SSM parameter storing the brokerMQ username."
  value       = aws_ssm_parameter.user_name.name
}

output "replication_user_password_ssm_parameter" {
  description = "The SSM parameter storing the replication user password for ActiveMQ."
  value       = var.broker_type == "ActiveMQ" ? aws_ssm_parameter.replication_user_password[0].name : null
}

output "broker_id" {
  description = "The ID of the MQ broker (RabbitMQ or ActiveMQ) based on the broker type."
  value       = var.broker_type == "RabbitMQ" ? aws_mq_broker.rabbit-mq[0].id : aws_mq_broker.active-mq[0].id
}
