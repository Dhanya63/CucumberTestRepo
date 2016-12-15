@inquiry_on_open_orders
Feature: Open Order Inquiry

#  TODO User "fg_csr" - as fast path is unavailable for fg_csr
  Scenario: TC77 - Inquire for domestic open orders
    Given I am logged in as "app_support" user
    And   I am on Domestic Sales Order page
    When  I inquire for next status "<999"
    Then  all the domestic open orders are displayed