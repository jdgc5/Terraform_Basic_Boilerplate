resource "aws_security_group" "sg_public_instance" {
    name        = "Public Instance Security Group"
    description = "Allow SSH inbound traffic and all egress traffic"
    vpc_id      = aws_vpc.vpc_virginia.id

    tags = {
        Name = "allow_tls"
    }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4         = aws_vpc.main.cidr_block
    from_port         = 443
    ip_protocol       = "tcp"
    to_port           = 443
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4" {
    security_group_id = aws_security_group.sg_public_instance.id
    cidr_ipv4         = "0.0.0.0/0"
    from_port         = 22
    ip_protocol       = "tcp"
    to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv6" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv6         = aws_vpc.main.ipv6_cidr_block
    from_port         = 443
    ip_protocol       = "tcp"
    to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv4         = "0.0.0.0/0"
    ip_protocol       = "-1" # semantically equivalent to all ports
    }

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
    security_group_id = aws_security_group.allow_tls.id
    cidr_ipv6         = "::/0"
    ip_protocol       = "-1" # semantically equivalent to all ports
}