Feature: register enterprise
  As a noosfero user
  I want to register an enterprise
  In order to interact in the web with my enterprise

  Background:
    Given the following users
      | login     | name       |
      | joaosilva | Joao Silva |

    And I am logged in as "joaosilva"
    And I am on Joao Silva's control panel
    And feature "enterprise_registration" is enabled on environment

  Scenario: enterprise registration is disabled by admin
    Given feature "enterprise_registration" is disabled on environment
    When I follow "Manage my groups"
    Then I should not see "Register a new enterprise"

  Scenario: approval method is admin
    Given organization_approval_method is "admin" on environment
    And I follow "Manage my groups"
    When I follow "Register a new enterprise"
    Then I should not see "Region"

  Scenario: approval method is region
    Given organization_approval_method is "region" on environment
    And the following enterprise
      | name      | identifier | owner     |
      | Validator | validator  | joaosilva |
    And the following validation info
      | validation_methodology | organization_name |
      | "Sample methodology"   | Validator         |
    And the following states
      | name          | validator_name |
      | Sample State  | Validator      |
    And I follow "Manage my groups"
    When I follow "Register a new enterprise"
    Then I should see "Region"

  Scenario: approval method is by region validator but there are no validators
    Given organization_approval_method is "region" on environment
    And I follow "Manage my groups"
    When I follow "Register a new enterprise"
    Then I should see "There are no validators to validate the registration of this new enterprise. Contact your administrator for instructions."

  Scenario: some active fields
    Given the following enterprise fields are active
      | foundation_year |
      | contact_person  |
      | contact_email   |
    And I follow "Manage my groups"
    When I follow "Register a new enterprise"
    Then I should see "Foundation year"
    Then I should see "Contact person"
    Then I should see "Contact email"

  Scenario: some required fields
    Given organization_approval_method is "admin" on environment
    And I follow "Manage my groups"
    And the following states
      | name          |
      | Sample State  |
    And the following enterprise fields are required
      | foundation_year |
      | contact_person  |
      | contact_email   |
    And I follow "Register a new enterprise"
    And I fill in the following:
      | Identifier        | my-enterprise   |
      | Name              | My Enterprise   |
      | Foundation year   |                 |
      | Contact person    |                 |
      | Contact email     |                 |
    When I press "Next"
    Then I should see "Foundation year can't be blank"
    Then I should see "Contact person can't be blank"
    Then I should see "Contact email can't be blank"

  Scenario: a user register an enterprise successfully through the admin
            validator method and the admin accepts
    Given organization_approval_method is "admin" on environment
    And I follow "Manage my groups"
    And the following states
      | name          |
      | Sample State  |
    And I follow "Register a new enterprise"
    And I fill in the following:
      | Identifier        | my-enterprise   |
      | Name              | My Enterprise   |
    And I press "Next"
    Then I should see "Enterprise Registration completed"
    And I am logged in as admin
    And I follow "Control panel"
    When I follow "Tasks"
    Then I should see /Processing task: Enterprise registration: "My Enterprise"/
    And I choose "Ok"
    And I press "Ok"
    And I am logged in as "joaosilva"
    And I am on Joao Silva's control panel
    When I follow "Manage my groups"
    Then I should see "My Enterprise"

  Scenario: a user register an enterprise successfully through the admin
            validator method and the admin rejects
    Given organization_approval_method is "admin" on environment
    And I follow "Manage my groups"
    And the following states
      | name          |
      | Sample State  |
    And I follow "Register a new enterprise"
    And I fill in the following:
      | Identifier        | my-enterprise   |
      | Name              | My Enterprise   |
    And I press "Next"
    Then I should see "Enterprise Registration completed"
    And I am logged in as admin
    And I follow "Control panel"
    When I follow "Tasks"
    Then I should see /Processing task: Enterprise registration: "My Enterprise"/
    And I choose "Cancel"
    And I fill in "Rejection explanation" with "This enterprise has some irregularities."
    And I press "Ok"
    And I am logged in as "joaosilva"
    And I am on Joao Silva's control panel
    When I follow "Manage my groups"
    Then I should not see "My Enterprise"

    Scenario: a user register an enterprise successfully through the region
              validator method and the validator accepts
    Given organization_approval_method is "region" on environment
    And I follow "Manage my groups"
    And the following enterprise
      | name      | identifier | owner     |
      | Validator | validator  | joaosilva |
    And the following validation info
      | validation_methodology | organization_name |
      | "Sample methodology"   | Validator         |
    And the following states
      | name          | validator_name |
      | Sample State  | Validator      |
    And I follow "Register a new enterprise"
    And I fill in the following:
      | Identifier        | my-enterprise   |
      | Name              | My Enterprise   |
    And I select "Sample State" from "Region"
    And I press "Next"
    Then I should see "Validator"
    Then I should see "Sample methodology"
    When I press "Confirm"
    Then I should see "Enterprise Registration completed"
    And I am on Validator's control panel
    When I follow "Tasks"
    Then I should see /Processing task: Enterprise registration: "My Enterprise"/
    And I choose "Ok"
    And I press "Ok"
    And I am on Joao Silva's control panel
    When I follow "Manage my groups"
    Then I should see "My Enterprise"

  Scenario: a user register an enterprise successfully through the region
            validator method and the validator rejects
    Given organization_approval_method is "region" on environment
    And I follow "Manage my groups"
    And the following enterprise
      | name      | identifier | owner     |
      | Validator | validator  | joaosilva |
    And the following validation info
      | validation_methodology | organization_name |
      | "Sample methodology"   | Validator         |
    And the following states
      | name          | validator_name |
      | Sample State  | Validator      |
    And I follow "Register a new enterprise"
    And I fill in the following:
      | Identifier        | my-enterprise   |
      | Name              | My Enterprise   |
    And I select "Sample State" from "Region"
    And I press "Next"
    Then I should see "Validator"
    Then I should see "Sample methodology"
    When I press "Confirm"
    Then I should see "Enterprise Registration completed"
    And I am on Validator's control panel
    When I follow "Tasks"
    Then I should see /Processing task: Enterprise registration: "My Enterprise"/
    And I choose "Cancel"
    And I fill in "Rejection explanation" with "This enterprise has some irregularities."
    And I press "Ok"
    And I am on Joao Silva's control panel
    When I follow "Manage my groups"
    Then I should not see "My Enterprise"