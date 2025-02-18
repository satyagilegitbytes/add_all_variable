variable "repo_name" {
  description = "Name of the GitHub repository"
  type        = string
}

variable "ruleset_name" {
  description = "Name of the ruleset"
  type        = string
}

variable "include_branches" {
  description = "List of branches to include in the ruleset"
  type        = list(string)
}

variable "exclude_branches" {
  description = "List of branches to exclude from the ruleset"
  type        = list(string)
}

variable "required_checks" {
  description = "List of required status checks"
  type        = list(string)
}
variable "update"{
  description = "this is an update in repo"
  type = bool
  default = true
}
variable "deletion"{
  description = "this is an update in repo"
  type = bool
  default = true
}
variable "required_linear"{
  description = "this is an update in repo"
  type = bool
  default = true
}
variable "required_sign"{
  description = "this is an update in repo"
  type = bool
  default = true
}
variable "non_fast_forward"{
  description = "this is an update in repo"
  type = bool
  default = true
}
variable "creation" {
  description = "this is creation of ruleset or not"
  type = bool
  default = true
}
#variable "github_owner" {
#  description = "GitHub username of the owner who can bypass branch protection"
#  type        = string
#}
