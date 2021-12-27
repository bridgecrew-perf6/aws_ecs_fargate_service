variable "name_prefix" {
  type = string
}
variable "standard_tags" {
  type = map(string)
}
variable "cluster_name" {
  type = string
}
variable "cluster_arn" {
  type = string
}
variable "app_name" {
  type = string
}
variable "container_memory" {
  type    = number
  default = 512
}

variable "task_memory" {
  type    = number
  default = null
}

variable "container_cpu" {
  type    = number
  default = 256
}

variable "task_cpu" {
  type    = number
  default = null
}

variable "container_image" {}
variable "app_port" {
  type = number
}
variable "entrypoint" {
  type    = list(string)
  default = null
}

variable "command" {
  type    = list(string)
  default = null
}

variable "container_desired_count" {
  type    = number
  default = 1
}
variable "container_max_capacity" {
  type    = number
  default = 1
}
variable "container_min_capacity" {
  type    = number
  default = 1
}
variable "container_cpu_low_threshold" {
  type    = number
  default = 80
}
variable "container_cpu_high_threshold" {
  type    = number
  default = 30
}

variable "task_role_arn" {
  type    = string
  default = null
}

variable "vpc_id" {}
variable "security_groups" {}
variable "subnets" {}
variable "aws_lb_arn" {}
variable "aws_lb_out_port" {}
variable "aws_lb_certificate_arn" {}
variable "health_check_grace_period_seconds" {
  type    = number
  default = null
}
variable "EMG_ENV" {
  type = string
  default = "azure-production"
}
variable "EMG_SET" {}
variable "account" {}
variable "launch_type" {
  default = "FARGATE"
}

variable "fargate_weight" {
  default = 1
}

variable "fargate_base" {
  default = 1
}

variable "fargate_spot_weight" {
  default = 1
}

variable "fargate_spot_base" {
  default = 0
}

variable "platform_version" {
  type = string
  default = "LATEST"
}

variable "mount_points" {
  type = list(object({
    containerPath = string
    sourceVolume  = string
    readOnly      = bool
  }))
  description = "Container mount points. This is a list of maps, where each map should contain a `containerPath` and `sourceVolume`"
  default     = []
}

variable "volumes" {
  type = list(object({
    name      = string
    efs_volume_configuration = list(object({
      file_system_id          = string
      root_directory          = string
    }))
  }))
  description = "Task volume definitions as list of configuration objects"
  default     = []
}

variable "additional_containers" {
  description = "Additional containers definition"
  default = []
}