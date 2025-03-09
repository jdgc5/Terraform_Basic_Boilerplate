variable "s3_buckets" {
    type        = list(string)
    description = "List of S3 bucket names"
}

variable "virginia_cidr" {
    default     = ["10.10.0.0/16","10.10.0.1/16"]
    description = "cidr de virginia"
    type        = list(string)   
    sensitive = true # This attribute hides the content of this variable when terraform show is executed.
}

variable "public_subnet_virginia"{
    
    default = "10.10.0.0/24"
    description = "CIDR public subnet"
    type = string

}

variable "private_subnet_virginia" {

    default = "10.10.1.0/24"
    description = "CIDR private subnet"
    type = string
}

variable "ohio"{
    type = object({
        name = string
        cantidad = number
        description = string
        cidr = list(string)
        env = string
    })
    default = {
        name = "ohio"
        cantidad = 1
        description = "cidr de ohio"  
        cidr     =  ["10.20.0.0/16"]
        env      = "Dev"
    }
}