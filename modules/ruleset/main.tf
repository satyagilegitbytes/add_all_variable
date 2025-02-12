resource "github_repository_ruleset" "rules" {
  provider    = github
  name        = var.ruleset_name
  repository  = var.repo_name
  target      = "branch"
  enforcement = "active"

  conditions {
    ref_name {
      include = var.include_branches
      exclude = var.exclude_branches
    }
  }

  rules {
    required_status_checks {
      dynamic "required_check" {
        for_each = var.required_checks
        content {
          context = required_check.value
        }
      }
    }

    creation                = true
    update                  = true
    deletion                = true
    required_linear_history = true
    required_signatures     = true
    non_fast_forward        = true
    #required_code_scanning  = true
     pull_request {
      # Required code scanning alerts (if needed)
      #required_code_scanning_alerts = true
      # required_code_scanning_alerts_threshold = "high"
    }
  }
}
