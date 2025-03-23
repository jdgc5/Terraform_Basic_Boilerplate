module "networking" {
  source     = "./modules/networking"
  s3_buckets = module.buckets.s3_buckets
  tags = var.tags

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
  ec2_specs = var.ec2_specs_info

  providers = {
    aws = aws.virginia
  }
}

module "terraform_state_backend" { #Example how works a module from https://registry.terraform.io/modules/cloudposse/tfstate-backend/aws/latest
  source = "cloudposse/tfstate-backend/aws"
  # Cloud Posse recommends pinning every module to a specific version
  version     = "1.5.0"
  namespace  = "example"
  stage      = "prod"
  name       = "terraform"
  attributes = ["state"]
  environment = "us-east-1"

  terraform_backend_config_file_path = "../../environments/dev"
  terraform_backend_config_file_name = "backend.tf"
  force_destroy                      = false
  }
