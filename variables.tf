// all the terraform variables are declared in this file
// variables those contains default value are considered optional others are mandatory

variable "provider_config" {
  type = object(
    {
      project_id = string,
      region = string,
      zone = string
    }
  )
}

variable "count_vm_names" {
  type = list(string)
}

variable "for_each_vm_names" {
  type = list(string)
}

variable "tags" {
  description = "Custom tags to set on the Instances"
  type        = map(string)
}

variable "ports" {
  type = list(string)
}