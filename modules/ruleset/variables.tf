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