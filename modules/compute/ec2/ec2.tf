resource "aws_instance" "public_instance" {
    ami                     = "ami-08b5b3a93ed654d19"
    instance_type           = "t2.micro" # free tier.
    subnet_id =  var.subnet_id
    key_name = data.aws_key_pair.key_ec2.key_name
    vpc_security_group_ids = [aws.security_group_id.sg_public_instance.id]

    tags = {
        Name = "EC2_Virginia_Test"
        env = "Dev"
    }

    lifecycle {
        create_before_destroy = false #true make this instance is created BEFORE being destroyed by any changes mad
        prevent_destroy = false #true makes this instance wont be destroyed after apply
        ignore_changes = [  ] #attribute list which you can include to avoid any modifications on applys. For example ami, instance_type
        #replacement_replace_triggered_by = [ aws_instance.public_instance.id ] This forces the resource to be replaced if the id of aws_instance.public_instance changes.
    }
}
