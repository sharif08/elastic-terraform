variable "apikey" {
  description = "Elastic Cloud API Key"
  default     = ""
  #sensitive   = true
}

variable "kibana_hostname" {
  description = "Elastic Cloud Kibana URL"
  default     = ""
  #sensitive   = true
}

variable "kibana_user" {
  description = "Elastic Cloud Kibana User"
  default     = ""
  #sensitive   = true
}

variable "kibana_pass" {
  description = "Elastic Cloud Kibana Password"
  default     = ""
  #sensitive   = true
}

variable "config_file" {
  description = "Config File Name of Yaml"
  default     = ""
}

variable "config_path" {
  description = "Config Path Name of Yaml"
  default     = ""
}

variable "lifecycle_name" {
  description = "Lifecycle Policy Name"
  default     = ""
}
