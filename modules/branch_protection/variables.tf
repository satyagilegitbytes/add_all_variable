variable "repo_name" {
  description = "The name of the GitHub repository"
  type        = string
}
variable "github_username" {
  description = "The name of the GitHub username"
  type        = string
}
variable "branches" {
  description = "A list of branches to protect"
  type        = list(string)
}

variable "required_approvals" {
  description = "The number of required approvals for pull requests"
  type        = number
  default     = 2
}

variable "require_code_owner_reviews" {
  description = "Enable/disable code owner review requirement"
  type        = bool
  default     = true
}

variable "require_status_checks" {
  description = "Enable/disable status check requirements"
  type        = bool
  default     = true
}

variable "required_status_checks_contexts" {
  description = "List of status checks to require"
  type        = list(string)
  default     = []
}

variable "enforce_admins" {
  description = "Whether to enforce branch protection for admins"
  type        = bool
  default     = true
}
variable "repo" {
  type        = set(string)
  description = "List of repository names to apply branch protection rules."
}
