resource "aws_security_group" "sg_public_instance" {
    name        = "Public Instance Security Group"
    description = "Allow SSH inbound traffic and all egress traffic"
    vpc_id      = aws_vpc.vpc_virginia.id

    tags = {
        Name = "allow_tls"
    }
}
resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.sg_public_instance.id
    cidr_ipv4         = "0.0.0.0/0"
    ip_protocol       = "-1" # Todos los protocolos
}

resource "aws_vpc_security_group_ingress_rule" "allow_all_traffic_ipv6" {
    security_group_id = aws_security_group.sg_public_instance.id
    cidr_ipv6         = "::/0"
    ip_protocol       = "-1" # Todos los protocolos
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
    security_group_id = aws_security_group.sg_public_instance.id
    cidr_ipv4         = "0.0.0.0/0"
    ip_protocol       = "-1" # Todos los protocolos
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv6" {
    security_group_id = aws_security_group.sg_public_instance.id
    cidr_ipv6         = "::/0"
    ip_protocol       = "-1" # Todos los protocolos
}