Feature: git town-hack: errors when the branch exists remotely

  (see ./branch_exists_locally.feature)


  Background:
    Given my coworker has a feature branch named "existing-feature"
    And I am on the "main" branch
    And my workspace has an uncommitted file
    When I run `git-town hack existing-feature`


  Scenario: result
    Then Git Town runs the commands
      | BRANCH | COMMAND           |
      | main   | git fetch --prune |
    And Git Town prints the error "A branch named 'existing-feature' already exists"
    And my repository is still on the "main" branch
    And my workspace still contains my uncommitted file
