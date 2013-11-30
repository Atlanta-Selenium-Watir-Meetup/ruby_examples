Feature:

  Scenario:
    Given I hop
    When I land
    Then I am on the ground

  Scenario: allowed to submit the form
    When I submit the form
    Then I should see the success message