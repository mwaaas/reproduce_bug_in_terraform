module "event_table" {
  source         = "./tf_modules/dyanamodb"

  providers = {
    aws = aws.custom_provider
  }
}