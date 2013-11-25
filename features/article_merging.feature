Feature: Articel Merging
  As an admin user
  In order to reduce duplicated articles in the site
  I want to merge two articles

  Background:
    Given the blog is set up
    And non-admin user is set up
    And I sign in as "puby" with password "ppppp"
    And I am on the new article page
    When I fill in "article_title" with "Foobar"
    And I fill in "article__body_and_extended_editor" with "Lorem Ipsum"
    And I press "Publish"
    Then I am on the new article page
    When I fill in "article_title" with "Barfoo"
    And I fill in "article__body_and_extended_editor" with "dolor sit amet,"
    And I press "Publish"
    Then I follow "Log out"
    Then I should be on log in page
 

  Scenario: A non-admin cannot merge articles
    Given I sign in as "puby" with password "ppppp"
    And I am on edit article "Foobar" page
    Then I should not find "merge_with" field

  Scenario: A admin user can see merge form
    Given I am logged into the admin panel
    And I am on edit article "Foobar" page
    Then I should find "merge_with" field

  Scenario: Successfully Merge articles
    Given I am logged into the admin panel
    And I am on edit article "Foobar" page
    Then I fill in "merge_with" with article id for "Barfoo"
    Then I press "Merge"
    Then I should be on the admin content page
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum dolor sit amet,"   






  

