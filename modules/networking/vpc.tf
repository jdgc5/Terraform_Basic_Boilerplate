resource "aws_vpc" "vpc_virginia" {
    cidr_block       = "10.10.0.0/16"
    instance_tenancy = "default"

    tags = {
        Name = "Vpc_Virginia"
        env = "Dev"
    }
    provider = aws.virginia
}

resource "aws_vpc" "vpc_ohio" {
    cidr_block       = "10.20.0.0/16"
    instance_tenancy = "default"

    tags = {
        Name = "Vpc_Ohio"
        env = "Dev"
    }
    provider = aws.ohio
}