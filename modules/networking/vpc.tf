resource "aws_vpc" "vpc_virginia" {
    cidr_block       = var.virginia_cidr
    instance_tenancy = "default"

    tags = {
        Name = "Vpc_Virginia"
        env = "Dev"
    }
    provider = aws.virginia
}

resource "aws_vpc" "vpc_ohio" {
    cidr_block       = var.ohio_cidr
    instance_tenancy = "default"

    tags = {
        Name = "Vpc_Ohio"
        env = "Dev"
    }
    provider = aws.ohio
}

