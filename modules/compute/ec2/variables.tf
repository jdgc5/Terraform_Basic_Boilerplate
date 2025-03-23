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

variable "instances" {
    description = "List of instances ec2 created for the examples"
    type = list(string)
    default = [ "apache","mysql","anotherInstance" ]
}

variable "enable_monitoring"{
    description = "enable EC2 instance if is activated by if condition"
    type = bool
    default = true
}

