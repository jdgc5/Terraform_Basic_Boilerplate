module "networking" {
    source = "./modules/networking"
    s3_buckets = module.buckets.s3_buckets
}

module "buckets" {
    source = "./environment/dev"
}
