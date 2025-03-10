output "s3_buckets" {
    value = var.s3_buckets
}

output "public_subnet" {
    description = "ID of the public subnet"
    value       = aws_subnet.public_subnet.id
}