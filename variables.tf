variable "cluster_name" {
    description = "The name of the ECS Cluster"
}

/* ECS optimized AMIs per region */
variable "amis" {
  default = {
    ap-northeast-1 = "ami-7d0c7a90"
    ap-northeast-2 = "ami-8f44f3e1"
    ap-southeast-1 = "ami-ae1b5a44"
    ap-southeast-2 = "ami-706cca12"
    ap-south-1     = "ami-f4b88a9b"
    eu-west-1      = "ami-39d530d4"
    eu-west-2      = "ami-2e9866c5"
    eu-west-3      = "ami-e976c694"
    us-east-1      = "ami-0b497f90712a8180b"
    us-east-2      = "ami-79d8e21c"
    us-west-1      = "ami-4351bc20"
    us-west-2      = "ami-f189d189"
    eu-central-1   = "ami-9fe2e074"
    ca-central-1   = "ami-c1b63ba5"
    sa-east-1      = "ami-a2c6e7ce"
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

