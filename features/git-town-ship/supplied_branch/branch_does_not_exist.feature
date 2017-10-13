Feature: git town-ship: errors when trying to ship a branch that doesn't exist

  As a developer trying to ship a branch that doesn't exist
  I should see an error telling me about this
  So that I can ship the correct branch and remain productive.


  Background:
    Given I am on the "main" branch
    And my workspace has an uncommitted file
    When I run `git-town ship non-existing-branch`


  Scenario: result
    Then it runs the commands
      | BRANCH | COMMAND           |
      | main   | git fetch --prune |
    And I get the error "There is no branch named 'non-existing-branch'"
    And my repository ends up on the "main" branch
    And my workspace still has my uncommitted file
