Feature: git town-ship: errors when trying to ship the main branch

  As a developer accidentally trying to ship the main branch
  I should see an error that this is not possible
  So that I know how to ship things correctly without having to read the manual.


  Background:
    Given I am on the "main" branch
    When I run `git-town ship -m 'something done'`


  Scenario: result
    Then Git Town prints the error "The branch 'main' is not a feature branch. Only feature branches can be shipped."
    And my repository is still on the "main" branch
    And there are no commits
    And there are no open changes
