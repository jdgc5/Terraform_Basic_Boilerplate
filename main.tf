module "networking" {
    source = "./modules/networking"
    s3_buckets = module.buckets.s3_buckets
}

module "buckets" {
    source = "./environment/dev"
}

module "ec2" {
    source = "./modules/compute/ec2"
    subnet_id = module.networking.public_subnet

    providers = {
        aws = aws.virginia
    }
}
