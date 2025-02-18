variable "github_token" {
  description = "GitHub Personal Access Token"
  type        = string
  sensitive   = true
}

variable "github_username" {
  description = "GitHub Username"
  type        = string
}

# New structure variable
variable "repositories" {
  description = "A map of repositories with branch protection and ruleset settings"
  type = map(object({
    repo_name = string
    ruleset = object({
      ruleset_name     = string
      include_branches = list(string)
      exclude_branches = list(string)
      required_checks  = list(string)
      update           = optional(bool, true)
      deletion         = optional(bool, true)
      required_linear  = optional(bool, true)
      required_sign    = optional(bool, true)
      non_fast_forward = optional(bool, true)
    })
    branch_protection = object({
      protected_branches              = list(string)
      required_approvals              = number
      require_code_owner_reviews      = bool
      require_status_checks           = bool
      required_status_checks_contexts = list(string)
      enforce_admins                  = bool
    })
  }))
}
# Old variables (extracted from repositories)
variable "repo_names" {
  description = "List of repository names"
  type        = list(string)
  default     = []
}

variable "protected_branches" {
  description = "A list of branches to protect in each repository"
  type        = list(string)
  default     = []
}

variable "ruleset_name" {
  description = "Name of the ruleset"
  type        = string
  default     = "Default Ruleset"
}

variable "include_branches" {
  description = "List of branches to include in the ruleset"
  type        = list(string)
  default     = ["refs/heads/main"]
}

variable "exclude_branches" {
  description = "List of branches to exclude from the ruleset"
  type        = list(string)
  default     = []
}

variable "required_checks" {
  description = "List of required status checks"
  type        = list(string)
  default     = ["ci/build", "ci/test"]
}

variable "required_approvals" {
  description = "The number of required approvals for pull requests"
  type        = number
  default     = 2
}

variable "require_code_owner_reviews" {
  description = "Enable or disable code owner reviews for the pull request"
  type        = bool
  default     = true
}

variable "require_status_checks" {
  description = "Enable or disable status check requirements"
  type        = bool
  default     = true
}

variable "required_status_checks_contexts" {
  description = "List of status checks to require for the branch"
  type        = list(string)
  default     = []
}

variable "enforce_admins" {
  description = "Whether to enforce branch protection for admins"
  type        = bool
  default     = true
}


