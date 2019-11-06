variable "dynamodb_endpont" {
  type = string
}

provider "aws" {
  region  = "eu-west-1"
  version = "~> 2.31"
  alias = "custom_provider"
  skip_credentials_validation = true
  skip_requesting_account_id = true
  endpoints {
    dynamodb = var.dynamodb_endpont
  }
}