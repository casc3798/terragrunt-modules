variable "lb_name" {
    description = "Name of the load balancer"
}

variable "internal" {
    description = "Boolean specifying if the load balancer will be hidden to the internet"
    type = bool
}

variable "subnets" {
    description = "Public (or private) subnets that will be used by this load balancer"
    type = list(string)
}

variable "project" {
    description = "Project that the load balancer is part of"
}

variable "security_group" {
    description = "Security group for the load balancer"
}