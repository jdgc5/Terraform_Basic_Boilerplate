resource "aws_instance" "public_instance" {
    ami                     = var.ec2_specs["ami"]   
    instance_type           = var.ec2_specs["instance_type"] 
    subnet_id =  var.subnet_id
    key_name = data.aws_key_pair.key_ec2.key_name
    vpc_security_group_ids = [var.security_group_id]
    count = length(var.instances) # number of instances may be created
    # user_data = file("../../../scripts/userdata.sh") # this a way to execute as root a script, avoid to uncomment if don't want to be charged by AWS.

    tags = {
        Name = "${var.instances[count.index]}-EC2_Virginia_Test-${local.sufix}"
        env = "Dev"
    }

    lifecycle {
        create_before_destroy = false #true make this instance is created BEFORE being destroyed by any changes mad
        prevent_destroy = false #true makes this instance wont be destroyed after apply
        ignore_changes = [  ] #attribute list which you can include to avoid any modifications on applys. For example ami, instance_type
        #replacement_replace_triggered_by = [ aws_instance.public_instance.id ] This forces the resource to be replaced if the id of aws_instance.public_instance changes.
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

    resource "aws_instance" "web_server_example" {
        
        ami           = var.ec2_specs["ami"]  
        instance_type = var.ec2_specs["instance_type"]  
        subnet_id     = var.subnet_id
        # we create an empty instance to import from any previously created resource in our AWS ACC
        # you can use the following sentence : "terraform import aws_instance.web_server_example 'instance-id'"
    }

    resource "null_resource" "instance_setup" {
        count = length(aws_instance.public_instance)

        provisioner "local-exec" {
            command = "powershell -Command \"Start-Sleep -s ${count.index} ; Add-Content -Path datos_instancia.txt -Value 'Created instance using IP: ${aws_instance.public_instance[count.index].public_ip}'\""
        }
        depends_on = [aws_instance.public_instance] # 
    }

    resource "null_resource" "save_instance_ips" {
        count = length(aws_instance.public_instance)

        provisioner "local-exec" {
            command = "powershell -Command \"Add-Content -Path instance_ips.txt -Value 'Instance IP: ${aws_instance.public_instance[count.index].public_ip}'\""
        }
    }

    resource "aws_instance" "conditional_instance" {
        count = var.enable_monitoring ? 1 : 0 # in true case count will be 0. Otherwilse, value is just 0
        ami                     = var.ec2_specs["ami"]   
        instance_type           = var.ec2_specs["instance_type"] 
        subnet_id =  var.subnet_id
        key_name = data.aws_key_pair.key_ec2.key_name
        vpc_security_group_ids = [var.security_group_id]
        # user_data = file("../../../scripts/userdata.sh") # this a way to execute as root a script, avoid to uncomment if don't want to be charged by AWS.

        tags = {
            Name = "${var.instances[count.index]}-EC2_Virginia_Test"
            env = "Dev"
        }
    }


