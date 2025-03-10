resource "aws_instance" "public_instance" {
    ami                     = "ami-08b5b3a93ed654d19"
    instance_type           = "t2.micro" # free tier.
    subnet_id =  var.subnet_id
    key_name = data.aws_key_pair.key_ec2.key_name

    tags = {
        Name = "EC2_Virginia_Test"
        env = "Dev"
    }
}
