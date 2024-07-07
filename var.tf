

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "public_cidrs" {
  description = "A list of public subnet CIDR blocks"
  type        = list(string)
}

variable "private_cidrs" {
  description = "A list of private subnet CIDR blocks"
  type        = list(string)
}

variable "azs" {
  description = "A list of availability zones"
  type        = list(string)
}

variable "database_cidrs" {}

variable "business_division" {
  description = "The business division"
  type        = string
}

variable "environment" {
  description = "The environment"
  type        = string
}

variable "IGW_name" {}
variable "public_routing_Table" {}
variable "private_routing_Table" {}
variable "Nat" {}
variable "Secuirty-group" {}


#aws dynamodb create-table --table-name dynamo-db-locking --attribute-definitions AttributeName=LockID,AttributeType=S --key-schema AttributeName=LockID,KeyType=HASH --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 --region us-east-1
