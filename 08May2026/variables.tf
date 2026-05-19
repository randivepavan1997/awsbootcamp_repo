variable "aws_region" {
  description = "AWS region to deploy the EKS cluster and other resources"
  type        = string
  default     =  "ap-south-1"
}

variable "public_subnet_1_cidr" {
  description = "CIDR block for public subnet 1"
  type        = string
  default = "10.0.12.0/24"
}

variable "public_subnet_2_cidr" {
  description = "CIDR block for public subnet 2"
  type        = string
  default = "10.0.23.0/24"
}

variable "tags" {
  description = "Common tags to apply to all resources"
  type        = map(string)
  default = {
    Owner = "pavan.randive@einfochips.com"
  }
}

variable "eks_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.35"
}

variable "service_ipv4_cidr" {
  description = "CIDR block for Kubernetes service IPs"
  type        = string
  default = "10.96.0.0/12"
}

variable "my_ip_cidr" {
  description = "CIDR block for your IP address to allow access to the EKS API server"
  type        = string
}

variable "node_group_instance_type" {
  description = "The EC2 instance type for the EKS node group"
  type        = list(string)
  default = [ "t3.medium" ]
}

variable "node_disk_size" {
  description = "The disk size (in GB) for the EKS node group instances"
  type        = number
  default = 20
}