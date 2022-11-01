# All policies start with the org package definition
package org

import future.keywords
import data.circleci.config

policy_name["check_demo_orbs"]

# define orbs to check for
check_demo_orbs = config.require_orbs(["circleci/python", "circleci/gcp-gcr", "circleci/gcp-gke", "circleci/kubernetes", "snyk/snyk"])

# signal to circleci that check_demo_orbs is enabled and must be included when making a decision
enable_rule["check_demo_orbs"] { data.meta.project_id == django_demo_id }

# signal to circleci that check_demo_orbs is a hard_failure condition and that builds should be
# stopped if this rule is not satisfied.
hard_fail["check_demo_orbs"] {
    check_demo_orbs
}