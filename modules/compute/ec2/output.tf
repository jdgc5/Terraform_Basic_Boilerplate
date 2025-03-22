output "ec2_public_id" {
    description = "Ip Publica instancia"
    value = aws_instance.public_instance[*].public_ip
}