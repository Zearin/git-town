Feature: git-sync: on a feature branch with a upstream remote

  Background:
    Given my repo has an upstream repo
    And my repository has a feature branch named "feature"
    And the following commits exist in my repository
      | BRANCH  | LOCATION | MESSAGE         |
      | main    | upstream | upstream commit |
      | feature | local    | local commit    |
    And I am on the "feature" branch
    And my workspace has an uncommitted file
    When I run `git-town sync`


  Scenario: result
    Then Git Town runs the commands
      | BRANCH  | COMMAND                            |
      | feature | git fetch --prune                  |
      |         | git add -A                         |
      |         | git stash                          |
      |         | git checkout main                  |
      | main    | git rebase origin/main             |
      |         | git fetch upstream                 |
      |         | git rebase upstream/main           |
      |         | git push                           |
      |         | git checkout feature               |
      | feature | git merge --no-edit origin/feature |
      |         | git merge --no-edit main           |
      |         | git push                           |
      |         | git stash pop                      |
    And my repository is still on the "feature" branch
    And my workspace still contains my uncommitted file
    And my repository has the following commits
      | BRANCH  | LOCATION                    | MESSAGE                          |
      | main    | local, remote, and upstream | upstream commit                  |
      | feature | local and remote            | local commit                     |
      |         |                             | upstream commit                  |
      |         |                             | Merge branch 'main' into feature |
