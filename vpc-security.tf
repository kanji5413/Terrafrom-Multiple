resource "aws_security_group" "POC-Allow" {
  name        = "${local.name}-Poc-Allow-sg"
  description = "Security Group with SSH, HTTP, and HTTPS ports open inbound, all ports open outbound"
  vpc_id      = "${aws_vpc.main.id}"

  # Ingress Rules using List Comprehension
  ingress = [
    for port in [20, 80, 443, 8080] : {
      description       = "Allow inbound traffic on port ${port}"
      from_port         = port
      to_port           = port
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
      ipv6_cidr_blocks  = []
      prefix_list_ids   = []
      security_groups   = []
      self              = false
    }
  ]

  # Egress Rule - Allow all outbound traffic
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  tags = merge(
    local.common_tags,
    {
      Name = "${var.Secuirty-group}"
    }
  )

}  