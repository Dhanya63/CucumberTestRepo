@home
Feature: Home

  Scenario: Valid user should be able to login
    Given I am on JDE login page
    When I login as "app_support" user
    Then I should see the JDE homepage
