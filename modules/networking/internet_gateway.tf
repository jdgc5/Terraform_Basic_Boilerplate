resource "aws_internet_gateway" "igw" { #IGW allows traffic to your VPC 
    vpc_id = aws_vpc.vpc_virginia.id

    tags = {
        Name = "IGW VPC Virginia"
    }
}
