variable "subnet_id" {
    description = "ID of the subnet where the instance will be launched"
    type        = string
}

# modules/compute/ec2/variables.tf
variable "security_group_id" {
    description = "ID of the Security Group for EC2 Instance"
    type        = string
}

variable "ec2_specs" {
    description = "Contains AMI and Type for EC2 Instance"
    type        = map(string)
}

