
variable "ec2_specs" {
    description = "Contains AMI and Type for EC2 Instance"
    type        = map(string)
}

variable "tags" {
    description = "List of variables that is contained on tfvars"
    type        = map(string)
}