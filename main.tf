terraform {
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = ">=5.89.0"
        }
    }
    required_version = "~>1.10.5"
}

provider "aws" {
    region = "us-east-1"
    alias  = "virginia"
}

provider "aws" {
    region = "us-east-2"
    alias  = "ohio"
}

module "networking" {
    source = "./modules/networking"
        providers = {
        aws = aws.virginia
    }
    s3_buckets = module.buckets.s3_buckets
}

module "buckets" {
    source = "./environment/dev"
}
