variable "AWS_DEFAULT_REGION" {
  description = "The AWS region things are created in variable pulled from TF Cloud"
  # default     = "us-east-2"
  default     = ""
}

variable "cluster_name" {
  default = "demo"
}

variable "cluster_version" {
  default = "1.22"
}

variable "public_subnetA" {
}

variable "public_subnetB" {
  
}

variable "public_subnetC" {
  
}

variable "private_subnetA" {
  
}

variable "private_subnetB" {
  
}

variable "private_subnetC" {
  
}

variable "vpc_id" {
  
}