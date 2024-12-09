region             = "us-east-1"
vpc_id             = "vpc-68f96212"
broker_name        = "example-rabbitmq"
broker_type        = "ActiveMQ"
engine_version     = "5.18"
host_instance_type = "mq.m5.large"
deployment_mode    = "ACTIVE_STANDBY_MULTI_AZ"
# deployment_mode   = "CLUSTER_MULTI_AZ"
security_group_name = "example-rabbitmq"
# subnet_ids        = ["subnet-6781cb49"]
subnet_ids          = ["subnet-6781cb49", "subnet-f55c1392"]
enable_logging      = true
publicly_accessible = false
storage_type        = "efs"

ingress_rules = [
  {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  },
  {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # "-1" allows all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }
]

users = {
  username = "admin"
  groups   = ["admins", "managers"]
}

users_replica = {
  replication_username = "replicator"
  groups               = ["replication-group"]
}
