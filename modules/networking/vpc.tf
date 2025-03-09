#calling list variable
resource "aws_vpc" "vpc_virginia" {
    cidr_block       = var.virginia_cidr[0]
    instance_tenancy = "default"
    provider = aws.virginia

    tags = {
        Name = "Vpc_Virginia"
        env = "Dev"
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id = aws_vpc.vpc_virginia.id
    cidr_block = var.public_subnet_virginia
    map_public_ip_on_launch = true # Default is false so you need to turn into true if u want to make it publick really.
    provider = aws.virginia
}

resource "aws_subnet" "private_subnet" {
    vpc_id = aws_vpc.vpc_virginia.id
    cidr_block = var.private_subnet_virginia
    provider = aws.virginia
}
# Calling object variable
resource "aws_vpc" "vpc_ohio" {
    cidr_block       = var.ohio.cidr[0]
    instance_tenancy = "default"
    provider = aws.ohio
    tags = {
        Name = var.ohio.name
        env = var.ohio.env
        description = var.ohio.description
    }
}

