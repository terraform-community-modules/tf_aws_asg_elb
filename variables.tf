//
// Module: tf_aws_asg_elb
//

// Module specific variables

// Launch Configuration Variables

variable "lc_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "iam_instance_profile" {}
variable "key_name" {}

variable "security_group" {}

variable "user_data" {
  description = "The path to a file with user_data for the instances"
}

// Auto-Scaling Group
variable "asg_name" {}
variable "asg_number_of_instances" {
  description = "The number of instances we want in the ASG"
  // We use this to populate the following ASG settings
  // - max_size
  // - desired_capacity
}

variable "asg_minimum_number_of_instances" {
  description = "The minimum number of instances the ASG should maintain"
  default = 1
  // Defaults to 1
  // Can be set to 0 if you never want the ASG to replace failed instances
}

variable "health_check_grace_period" {
  description = "Number of seconds for a health check to time out"
  default = 300
}
variable "health_check_type" {
  default = "ELB"
  //Types available are:
  // - ELB
  // - EC2
  // * http://docs.aws.amazon.com/cli/latest/reference/autoscaling/create-auto-scaling-group.html#options
}
variable "load_balancer_name" {}

//Our template assumes two AZs and two VPC subnets for them
variable "subnet_az1" {
  description = "The VPC subnet ID for AZ1"
}
variable "subnet_az2" {
  description = "The VPC subnet ID for AZ2"
}

// Variables for providers used in this module
variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {}
