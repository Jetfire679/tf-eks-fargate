# Private Subnets - load params from SSM
data "aws_ssm_parameter" "rlv-PriSubA_ID" {
  name = "rlv-PriSubA_ID"
}

data "aws_ssm_parameter" "rlv-PriSubB_ID" {
  name = "rlv-PriSubB_ID"
}

data "aws_ssm_parameter" "rlv-PriSubC_ID" {
  name = "rlv-PriSubC_ID"
}

data "aws_ssm_parameter" "rlv-PriSubA" {
  name = "rlv-PriSubA"
}

data "aws_ssm_parameter" "rlv-PriSubB" {
  name = "rlv-PriSubB"
}

data "aws_ssm_parameter" "rlv-PriSubC" {
  name = "rlv-PriSubC"
}

# Public Subnets - load params from SSM
data "aws_ssm_parameter" "rlv-VpcId" {
  name = "rlv-VpcId"
}

data "aws_ssm_parameter" "rlv-PubSubA_ID" {
  name = "rlv-PubSubA_ID"
}

data "aws_ssm_parameter" "rlv-PubSubB_ID" {
  name = "rlv-PubSubB_ID"
}

data "aws_ssm_parameter" "rlv-PubSubC_ID" {
  name = "rlv-PubSubC_ID"
}

data "aws_ssm_parameter" "rlv-PubSubA" {
  name = "rlv-PubSubA"
}

data "aws_ssm_parameter" "rlv-PubSubB" {
  name = "rlv-PubSubB"
}

data "aws_ssm_parameter" "rlv-PubSubC" {
  name = "rlv-PubSubC"
}

# data "aws_ssm_parameter" "kafka-bootstrap_brokers" {
#   name = "kafka-bootstrap_brokers"
# }

# data "aws_ssm_parameter" "kafka-zookeeper_connect_string" {
#   name = "kafka-zookeeper_connect_string"
# }