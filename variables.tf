variable "cluster_name" {
    description = "The name of the ECS Cluster"
}

/* ECS optimized AMIs per region */
variable "amis" {
  default = {
    ap-northeast-1 = "ami-372f5450"
    ap-southeast-1 = "ami-69208a0a"
    ap-southeast-2 = "ami-307f7853"
    eu-west-1      = "ami-48f9a52e"
    eu-west-2      = "ami-62aea406"
    us-east-1      = "ami-d69c74c0"
    us-east-2      = "ami-64270201"
    us-west-1      = "ami-bc90c2dc"
    us-west-2      = "ami-8e7bc4ee"
    eu-central-1   = "ami-6b428d04"
    ca-central-1   = "ami-b2e65bd6"
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
    type = "list"
    description = "List of EC2 availability zones to launch instances, must be within region"
}

variable "subnet_ids" {
    type = "list"
    description = "List of subnet ids, must match availability zones"
}

variable "security_group_ids" {
    type = "list"
    description = "List of security group ids"
    default = []
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

variable "root_block_device_type" {
    default = "standard"
    description = "Type of ECS instance root volume"
}

variable "root_block_device_size" {
    default = "8"
    description = "Size of ECS instance root volume"
}

variable "root_block_device_delete" {
    default = true
    description = "Mark ECS instance root volume for removal"
}

variable "root_block_device_iops" {
    default = "0"
    description = "IOPS throughput of ECS instance root volume"
}

variable "ebs_block_device_name" {
    default = "/dev/xvdcz"
    description = "Name of ECS docker volume"
}

variable "ebs_block_device_type" {
    default = "standard"
    description = "Type of ECS docker volume"
}

variable "ebs_block_device_size" {
    default = "22"
    description = "Size of ECS docker volume in GiB"
}

variable "ebs_block_device_delete" {
    default = true
    description = "Mark ECS docker volume for removal"
}

variable "ebs_block_device_iops" {
    default = "0"
    description = "IOPS throughput of ECS docker volume"
}

variable "associate_public_ip_address" {
    # not a good choice here, see
    # https://github.com/hashicorp/terraform/issues/4292#issuecomment-247116116
    default = "false"
    description = "Associate public IP with instance"
}

variable "ecs_user_data" {
    default = ""
    description = "Additional user_data for ECS cluster instances"
}

#Things below are added due to: https://github.com/hashicorp/terraform/issues/9098
variable "nodeexporter_port" {
    default = 9100
    description = "My ugly and temporary fix to get additional tags"
}
variable "cadvisor_port" {
    default = 9101
    description = "My ugly and temporary fix to get additional tags"
}

