variable "extra_tags" {
  description = "Extra tags to add"
  type        = map(string)
  default     = {}
}

variable "logic_app_extra_tags" {
  description = "Extra tags to add to Logic app"
  type        = map(string)
  default     = {}
}