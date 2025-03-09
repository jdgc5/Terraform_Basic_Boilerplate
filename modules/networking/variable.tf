variable "virginia_cidr" {
    default     = ["10.10.0.0/16","10.10.0.1/16"]
    description = "cidr de virginia"
    type        = list(string)   
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
        name = ohio
        cantidad = 1
        description = "cidr de ohio"  
        cidr     =  "10.20.0.0/16"
        env      = "Dev"
    }
}