resource "aws_instance" "public_instance" {
    ami                     = "ami-08b5b3a93ed654d19"
    instance_type           = "t2.micro" # free tier.
    subnet_id =  var.subnet_id
    key_name = data.aws_key_pair.key_ec2.key_name
    vpc_security_group_ids = [var.security_group_id]
/*     user_data = <<-EOF # In this case this will be executed by root all these commands you wish.
        #!/bin/bash
        # Refresh the system
        sudo yum update -y

        # Install Apache
        sudo yum install -y httpd

        # Init Apache and enable it 
        sudo systemctl start httpd
        sudo systemctl enable httpd

        # Create a message.txt
        echo "This is a random message" > ~/message.txt
        EOF */

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
