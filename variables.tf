variable "enabled" {
  type        = bool
  default     = true
  description = "Enable/Disable to define resource creation."
}

variable "environment" {
  type        = string
  default     = ""
  description = "Value of environment Eg: 'dev', 'stg', 'plat'"
}

variable "stage" {
  type        = string
  default     = ""
  description = "Value of stage Eg: 'development', 'staging', 'platform'"
}

variable "name" {
  type        = string
  default     = ""
  description = "Name of the service Eg: 'jenkins'"
}

variable "delimiter" {
  type        = string
  default     = "-"
  description = "Delimiter to use between the concatination"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional properties (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags Eg: `map('Team','SRE')`"
}

variable "additional_tag_map" {
  type        = map(string)
  default     = {}
  description = "Additional tags appending to each tag map"
}

variable "label_order" {
  type        = list(string)
  default     = []
  description = "Order for naming Eg: `name-environment`"
}

variable "regex_replace_chars" {
  type        = string
  default     = "/[^a-zA-Z0-9-]/"
  description = "Regex to replace chars with empty string"
}