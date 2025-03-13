resource "aws_instance" "public_instance" {
    ami                     = var.ec2_specs["ami"]   
    instance_type           = var.ec2_specs["instance_type"] 
    subnet_id =  var.subnet_id
    key_name = data.aws_key_pair.key_ec2.key_name
    vpc_security_group_ids = [var.security_group_id]
    # user_data = file("../../../scripts/userdata.sh") # this a way to execute as root a script, avoid to uncomment if don't want to be charged by AWS.

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

    provisioner "local-exec" { #once this instance is executed a local command has been launched, in this case to save public id in a txt file
        command = "echo instancia creada con IP ${aws_instance.public_instance.public_ip} >> datos_instancia.txt"
    }

    provisioner "local-exec" {
        when = destroy 
        command = "echo instancia creada con IP ${self.public_ip} >> datos_instancia.txt"
    }

    # provisioner "remote-exec" { #once you are connected to the instance the command inline will be executed.
    #     inline = [ "echo 'hi world' > ~/hi.txt"  ]
    #     connection {
    #         type = "ssh"
    #         host = self.public_ip
    #         user = "ec2-user"
    #         private_key = file("mykey.pem") #Relative Route
    #     }
    # }

}
