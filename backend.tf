terraform {
  backend "s3" {
    bucket = "anji1592581"
    key    = "terrafrom/POC.tfstate"
    region = "us-east-1"
    encrypt        = true
    dynamodb_table = "dynamo-db-locking" ##need to create the dynamodb table then use this if any developer need to any actions it will get an error
  }
}