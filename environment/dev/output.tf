output "s3_buckets" {
    description = "Lista de nombres de los buckets creados"
    value       = aws_s3_bucket.bucket_prueba_atoj[*].bucket
}
