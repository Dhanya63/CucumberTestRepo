@@item_ledeger_cardex
Feature: Item ledger cardex

  Scenario: TC41 - Inquire on Item Ledger Cardex with valid 'Item Number' and 'valid Branch/Plant'
    Given I am logged in as "app_support" user
    And I am on Item Ledger Cardex page
    And I enter a valid item "14010"
    And I enter a valid branch-plant "300001"
    When I inquire on the Item Ledger Cardex
    And I select a valid row "1"
    Then item details should be displayed in the Item Ledger Cardex form