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

variable "agent_file_policy" {
  description = "Config File Agent Policy of Yaml"
  default     = ""
}

variable "config_file" {
  description = "Config File Kubernetes Integration of Yaml"
  default     = ""
}

variable "config_path" {
  description = "Config Path Kubernetes Integration of Yaml"
  default     = ""
}
