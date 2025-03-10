resource "aws_instance" "public_instance" {
    ami                     = "ami-08b5b3a93ed654d19"
    instance_type           = "t2.micro" # free tier.
    subnet_id =  var.subnet_id
}
