

resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(
    local.common_tags,
    {
      Name = var.vpc_name
    }
  )
}

resource "aws_subnet" "public-subnets" {
  count = length(var.public_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.public_cidrs, count.index)
  availability_zone = element(var.azs, count.index)
  map_public_ip_on_launch = true

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-public-subnet-${count.index + 1}"
    }
  )
}

resource "aws_subnet" "private-subnets" {
  count = length(var.private_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.private_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
    }
  )
}


resource "aws_subnet" "database-subnets" {
  count = length(var.database_cidrs)
  vpc_id = aws_vpc.main.id
  cidr_block = element(var.database_cidrs, count.index)
  availability_zone = element(var.azs, count.index)

  tags = merge(
    local.common_tags,
    {
      Name = "${var.vpc_name}-database-subnet-${count.index + 1}"
    }
  )
}

resource "aws_internet_gateway" "default" {
    vpc_id = aws_vpc.main.id

	tags =merge(
    local.common_tags,
    {
        Name = "${var.IGW_name}"
    }
  ) 
}
