module "networking" {
  source     = "./modules/networking"
  s3_buckets = module.buckets.s3_buckets

    providers = {
    aws = aws.virginia
  }
}

module "buckets" {
  source = "./environment/dev"
}

module "ec2" {
  source    = "./modules/compute/ec2"
  subnet_id = module.networking.public_subnet
  security_group_id = module.networking.sg_public_instance_id
  ec2_specs = var.ec2_specs

  providers = {
    aws = aws.virginia
  }
}
