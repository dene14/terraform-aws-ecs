variable "cluster_name" {
    description = "The name of the ECS Cluster"
}

/* ECS optimized AMIs per region */
variable "amis" {
  default = {
    ap-northeast-1 = "ami-a98d97c7"
    ap-southeast-1 = "ami-4b3ee928"
    ap-southeast-2 = "ami-513c1032"
    eu-west-1      = "ami-f66de585"
    us-east-1      = "ami-a1fa1acc"
    us-west-1      = "ami-68106908"
    us-west-2      = "ami-a28476c2"
    eu-central-1   = "ami-f66de585"
  }
}

variable "key_name" {
    description = "SSH key name in your AWS account for AWS instances."
}

variable "region" {
    default = "us-east-1"
    description = "The region of AWS"
}

variable "availability_zones" {
    description = "Comma separated list of EC2 availability zones to launch instances, must be within region"
}

variable "subnet_ids" {
    description = "Comma separated list of subnet ids, must match availability zones"
}

variable "security_group_ids" {
    description = "Comma separated list of security group ids"
    default = ""
}

variable "instance_type" {
    default = "m1.small"
    description = "Name of the AWS instance type"
}

variable "min_size" {
    default = "1"
    description = "Minimum number of instances to run in the group"
}

variable "max_size" {
    default = "5"
    description = "Maximum number of instances to run in the group"
}

variable "desired_capacity" {
    default = "1"
    description = "Desired number of instances to run in the group"
}

variable "health_check_grace_period" {
    default = "300"
    description = "Time after instance comes into service before checking health"
}

variable "registry_url" {
    default = "https://index.docker.io/v1/"
    description = "Docker private registry URL, defaults to Docker index"
}

variable "registry_email" {
    default = ""
    description = "Docker private registry login email address"
}

variable "registry_auth" {
    default = ""
    description = "Docker private registry login auth token (from ~/.dockercgf)"
}

variable "environment_name" {
    default = ""
    description = "Environment name to tag EC2 resources with (tag=environment)"
}
