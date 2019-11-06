variable "dynamodb_endpont" {
  type = string
}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.31"
  alias = "custom_provider"
  endpoints {
    dynamodb = var.dynamodb_endpont
  }
}