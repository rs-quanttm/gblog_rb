///////////////////////////////////////////////////////////////////////////
# Need to get the credential from AWS SSM
///////////////////////////////////////////////////////////////////////////

variable "database_password" {
  description = "Name of database password"
}

variable "rails_master_key" {
  description = "Encrypted key as rails master key"
}

variable "github_token" {
  description = "Github personal access token"
}

variable "docker_username" {
  description = "Docker Username"
}

variable "docker_password" {
  description = "Docker Password"
}

///////////////////////////////////////////////////////////////////////////
# Please update default values if needed
///////////////////////////////////////////////////////////////////////////

variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "g_blog"
}

variable "env" {
  description = "Environment that is used as placeholder"
  default     = "development"
}

variable "azs" {
  description = "A list of availability zones in the region"
  default     = ["ap-northeast-1a", "ap-northeast-1c", "ap-northeast-1d"]
}

# IP architecture
# https://www.notion.so/iruuzainc/IP-architecture-85d035693086447c88fcf286f682d21b

variable "database_name" {
  description = "Name of database name"
  default     = "g_blog_development"
}

variable "database_user" {
  description = "Name of database user"
  default     = "g_blog_development"
}



variable "instance_class" {
  description = "Database instance type"
  instance_class = "db.t3.micro"
}


variable "lb_healthcheck_path" {
  description = "Path of loadbalancer's health check"
  default     = "/health"
}

variable "github_account" {
  description = "Github account name of access token"
  default     = "Jitera"
}

variable "github_repository" {
  description = "Github repository to get source"
  default     = ""
}

variable "github_branch" {
  description = "Git branch to get source"
  default     = "staging"
}

variable "zone_id" {
  description = "Zone ID"
  default     = ""
}

variable "domain" {
  description = "Domain"
  default     = "gblog-development.project.jitera.app"
}

variable "slack_channel_id" {
  description = "Slack Channel identifier"
  default     = ""
}

variable "slack_workspace_id" {
  description = "Slack Workspace identifier"
  default     = ""
}

variable "notify_slack_webhook_url" {
  description = "Slack Webhook for Cloudwatch notification"
  default     = ""
}

variable "notify_slack_channel" {
  description = "Slack channel for Cloudwatch notificationr"
  default     = ""
}

variable "aws_account_id" {
  description = "AWS Account ID"
  default     = ""
}
# s3 storage bucket
variable "iam_user_name" {
  default = "s3-development-user"
}

variable "bucket_name" {
  default = "gblog-development-storage"
}

variable "country_code" {
  description = "The list of restricted country"
  default     = []
}
# Example: https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html
# db.t3.small: 150 connections, db.t3.medium: 500 connections 
# https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.DBInstanceClass.html
variable "database_max_connection" { 
  description = "Maximum number of connections"
  default     = "150"
}