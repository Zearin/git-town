Feature: git-repo when origin is unsupported

  Background:
    When I run `git-town repo`


  Scenario: result
    Then Git Town prints the error:
      """
      Unsupported hosting service

      This command requires hosting on one of these services:
      * Bitbucket
      * Github
      * Gitlab
      """
