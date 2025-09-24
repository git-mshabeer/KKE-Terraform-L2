variable "KKE_VPC_NAME" {
  description = "Name of the VPC"
  type        = string
}

variable "KKE_VPC_CIDR" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "KKE_SUBNET_NAME" {
  description = "Name of the subnet"
  type        = string
}

variable "KKE_SUBNET_CIDR" {
  description = "CIDR block for the subnet"
  type        = string
}

variable "KKE_EC2_NAME" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "KKE_EC2_TYPE" {
  description = "Instance type of the EC2"
  type        = string
}