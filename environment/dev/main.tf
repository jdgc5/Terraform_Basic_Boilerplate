resource "random_string" "suffix"{
    count = var.bucket_count
    length = 8
    upper = false
    numeric = false
    special = false
}

resource "aws_s3_bucket" "bucket-prueba-atoj" {
    count = var.bucket_count
    bucket = "${var.bucket_prefix}-${random_string.suffix[count.index].id}"

    tags = {
        Owner       = "ATOJ"
        Environment = "Dev"
        Office      = "Proveedores"
    }
}

