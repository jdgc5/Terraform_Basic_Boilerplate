variable "subnet_id" {
    description = "ID of the subnet where the instance will be launched"
    type        = string
}

# modules/compute/ec2/variables.tf
variable "security_group_id" {
    description = "ID del Security Group para la instancia EC2"
    type        = string
}