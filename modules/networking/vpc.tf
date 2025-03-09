#calling list variable
resource "aws_vpc" "vpc_virginia" {
    cidr_block       = var.virginia_cidr[0]
    instance_tenancy = "default"

    tags = {
        Name = "Vpc_Virginia"
        env = "Dev"
    }
    provider = aws.virginia
}
# Calling object variable
resource "aws_vpc" "vpc_ohio" {
    cidr_block       = var.ohio.cidr[0]
    instance_tenancy = "default"

    tags = {
        Name = var.ohio.name
        env = var.ohio.env
        description = var.ohio.description
    }
    provider = aws.ohio
}

