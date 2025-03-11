output "s3_buckets" {
    description = "Lista de nombres de los buckets creados"
    value       = module.buckets.s3_buckets
}
