variable "aws_access_key" {}

variable "aws_secret_key" {}

variable "region" {
        default = "ap-south-1"
}

#VPC
variable "vpc_cidr" {
	default = "10.20.0.0/16"
}

variable "subnets_cidr1" {
	default = "10.20.1.0/24"
}

variable "subnets_cidr2" {
	default = "10.20.2.0/24"
}

variable "azs" {
	type = "list"
	default = ["ap-south-1a", "ap-south-1b"]
}
