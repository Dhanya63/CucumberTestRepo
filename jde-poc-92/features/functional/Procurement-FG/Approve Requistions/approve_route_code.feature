Feature: Requisition Route and Default Branch Setup

  @once @TC-99
  Scenario Outline: Approval Level Revision (Route Setup)
    Given I am logged in as "app_support" user
    And I fastpath to "P43008,FOOD0001"
    And  I inquire a valid route code "<route_code>"
    And I enter a valid amount "<amount>"
    And I enter a valid approver_id for "app_support" user
    Then the route code is updated

    Examples:
    |route_code| amount |
    | JDE     | 2000    |

  @once
    # Delete method should be executed prior to the TC-201 as to add the new approval route code for an user
    # in the next test case
  Scenario: Delete the entry of the user associated with approval route code
    Given I am logged in as "app_support" user
    And I fastpath to "P400951"
    And I delete the user associated with the approval route code

  @once @TC-201
  Scenario Outline: Approval route code for user adding a new entry
    Given I am logged in as "app_support" user
    And I fastpath to "P400951"
    When I add an existing user "<user_id>"
    And I enter a valid approval route code "<approval_rc>"
    Then the user is assigned with the route code

    Examples:
    |user_id     | approval_rc |
    |e1testing   | JDE         |


    @once @TC-101
    Scenario: Approval Route Code Report
      Given I am logged in as "app_support" user
      And I fastpath to "JRS0000002500"
      And I enter valid branch number "718300"
      Then I verify the report is generated successfully


    # Scenario: Approved Requsition Inquiry
     #  Given I am logged in as "app_support" user
     #  And I fastpath to "JRS0000002494"
     # And I filter by recent order date
     #   And I enter a valid branch plant number "718300"
     #  Then the list of approved requistion is diaplayed





