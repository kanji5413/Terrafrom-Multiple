resource "aws_eip" "eip-nat" {
    vpc = true   #this deprecated
    #domain = "vpc"  #use this this present using 
}

resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.eip-nat.id
    subnet_id     = aws_subnet.public-subnets[0].id

    tags = merge (
        local.common_tags,{
            Name = "${var.Nat}"
        }
    )
}
