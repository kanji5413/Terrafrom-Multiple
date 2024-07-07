
vpc_cidr     = "10.1.0.0/16"
vpc_name     = "POC-vpc"
public_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]
private_cidrs = ["10.1.10.0/24", "10.1.20.0/24"]
azs          = ["us-east-1a", "us-east-1b"]
database_cidrs = ["10.1.100.0/24", "10.1.200.0/24"]
business_division = "Poc"
environment       = "POC-testing"
IGW_name = "POC-igw"
public_routing_Table = "POC_public_table-testing"
private_routing_Table = "POC_private_table-testing"
Nat               = "nat-gateway-private-subnets"
Secuirty-group    = "POC-Secuirty-Group"