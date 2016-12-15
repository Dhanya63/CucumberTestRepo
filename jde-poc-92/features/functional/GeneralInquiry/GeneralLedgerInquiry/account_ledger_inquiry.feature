@account_ledger_inquiry
Feature: General Ledger Inquiry

  Scenario Outline: TC343 Account Ledger Inquiry
    Given I am logged in as "app_support" user
    And I fastpath to "P09200"
    And I have a valid account as <account_no>
    And I have a from date as <from_date>
    And I have a thru date as <thru_date>
    When I inquire on the account
    Then the transactions are displayed

    Examples:
    | account_no      | from_date   | thru_date    |
    | "100.1020.AUS"  | "03/28/2016" | "04/24/2016"  |
   # | "100.1020.AUS"  | "8/28/2016" | "4/24/2016"  |
