resource "aws_route_table" "terraform-public" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }

    tags = merge (
        local.common_tags,{
            Name = "${var.public_routing_Table}"
        }
    )
}

resource "aws_route_table" "terraform-private" {
    vpc_id = "${aws_vpc.main.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_nat_gateway.nat-gw.id}"
    }


    tags = merge (
        local.common_tags,{
            Name = "${var.private_routing_Table}"
        }
    )
}

resource "aws_route_table_association" "terraform-public" {
    count = var.environment == "prod" ? 3 : length(var.public_cidrs)
    subnet_id = "${element(aws_subnet.public-subnets.*.id, count.index)}"
    route_table_id = "${aws_route_table.terraform-public.id}"
}

#if you want single 
/*
resource "aws_route_table_association" "terraform-public" {
    count = var.environment == "prod" ? 3 : length(var.private_cidrs)
    subnet_id = "${element(aws_subnet.private-subnets.*.id, count.index)}"
    route_table_id = "${aws_route_table.terraform-private.id}"
}
*/

#if you want two subnets in single route table like database and private 
resource "aws_route_table_association" "terraform-private" {
  count          = var.environment == "prod" ? 3 : length(concat(var.private_cidrs, var.database_cidrs))
  subnet_id      = element(concat(aws_subnet.private-subnets.*.id, aws_subnet.database-subnets.*.id), count.index)
  route_table_id = "${aws_route_table.terraform-private.id}"
}