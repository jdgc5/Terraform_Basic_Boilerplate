output "s3_buckets" {
    value = var.s3_buckets
}

output "public_subnet" {
    description = "ID of the public subnet"
    value       = aws_subnet.public_subnet.id
}

output "sg_public_instance_id" {
    description = "ID del Security Group para la instancia pública"
    value       = aws_security_group.sg_public_instance.id
}