variable "bucket_count" {
    description = "Número de buckets a crear"
    type        = number
    default     = 2
}

variable "region" {
    description = "Región de AWS"
    type        = string
    default     = "us-east-1"
}

variable "bucket_prefix" {
    description = "Prefijo para los nombres de los buckets"
    type        = string
    default     = "proveedores-regional-bucket-prueba-atoj"
}
