terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = "~> 2.34"
  }
}

provider "aws" {
  region = "eu-west-1"
}

locals {
  default_tags = {
    Classification    = "restricted"
    Environment       = "staging"
    Owner             = "sysdev"
    Status            = "active"
  }
}

resource "aws_dynamodb_table" "demo-table" {
  hash_key = "id"
  name = "foo"
  billing_mode = "PAY_PER_REQUEST"
  attribute {
    name = "id"
    type = "S"
  }

  tags = merge(local.default_tags, map("Name", "foo"))
}