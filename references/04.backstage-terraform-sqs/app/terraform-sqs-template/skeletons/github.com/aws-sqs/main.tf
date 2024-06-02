provider "aws" {
  region = var.aws_region

  skip_credentials_validation = true
  skip_region_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  
  #### https://registry.terraform.io/providers/hashicorp/aws/5.1.0/docs/guides/custom-service-endpoints.html#available-endpoint-customizations
  endpoints {
    apigateway     = "http://192.168.56.174:4566"
    cloudformation = "http://192.168.56.174:4566"
    cloudwatch     = "http://192.168.56.174:4566"
    dynamodb       = "http://192.168.56.174:4566"
    es             = "http://192.168.56.174:4566"
    firehose       = "http://192.168.56.174:4566"
    iam            = "http://192.168.56.174:4566"
    kinesis        = "http://192.168.56.174:4566"
    lambda         = "http://192.168.56.174:4566"
    route53        = "http://192.168.56.174:4566"
    redshift       = "http://192.168.56.174:4566"
    s3             = "http://192.168.56.174:4566"
    secretsmanager = "http://192.168.56.174:4566"
    ses            = "http://192.168.56.174:4566"
    sns            = "http://192.168.56.174:4566"
    sqs            = "http://192.168.56.174:4566"
    ssm            = "http://192.168.56.174:4566"
    stepfunctions  = "http://192.168.56.174:4566"
    sts            = "http://192.168.56.174:4566"
    ec2            = "http://192.168.56.174:4566"
    elb            = "http://192.168.56.174:4566"
    elbv2          = "http://192.168.56.174:4566"

  }

}

terraform {
    backend "consul" {}
}

locals {
  name = var.fifo_queue ? format("%s.fifo", module.sqs_label.id) : module.sqs_label.id
}

module "sqs_label" {
  source = "git::https://github.com/cloudposse/terraform-null-label.git?ref=0.24.1"

  namespace  = var.namespace
  environment= var.environment
  stage      = var.stage
  name       = var.name
  attributes = ["sqs"]
  tags       = var.tags
}

module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"
  version = "3.1.0"

  name = local.name

  visibility_timeout_seconds = var.visibility_timeout_seconds
  message_retention_seconds  = var.message_retention_seconds
  max_message_size           = var.max_message_size
  delay_seconds              = var.delay_seconds
  receive_wait_time_seconds  = var.receive_wait_time_seconds
  policy                     = var.policy
  redrive_policy             = var.redrive_policy
  fifo_queue                 = var.fifo_queue
  content_based_deduplication = var.content_based_deduplication

  kms_master_key_id                 = var.kms_master_key_id
  kms_data_key_reuse_period_seconds = var.kms_data_key_reuse_period_seconds



  tags = module.sqs_label.tags
}
