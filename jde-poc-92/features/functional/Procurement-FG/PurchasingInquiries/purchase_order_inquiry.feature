@purchasing_inquiry
Feature: Purchasing Inquiry

  Scenario Outline: TC436 - Inquire for the purchase order
    Given I am logged in as "app_support" user
    And   I am on Purchasing Inquiry page
    When  I enter a valid branch plant <branch_plant> number
    And   I filter by order date
    Then  a list of purchase orders is displayed

  Examples:
  |branch_plant |
  |"318465"     |