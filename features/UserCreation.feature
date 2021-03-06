#encoding: utf-8
Feature: Create a new User of Schadenfreude
	In order to verify that new users can be created, saved in the database and 
	As a Schadenfreude user, so that I can interact with others,
	I want to be able to create a profile with basic personal information about myself.
	
	Scenario: Creating a new User
		Given I am on the Schadenfreude home page
		When I follow "Add New User"
		When I fill in "First Name" with "Will"
		And I fill in "Last Name" with "Mortl"
		And I fill in "E-mail" with "Imawesome@gmail.com"
		And I fill in "Password" with "blup"
		And I select the date "11/11/1985" for "birthday"
		And I press "Create Profile"
		Then I should be on the Schadenfreude home page
		And I should see "Will"
		And I should see "Mortl"
		And I should see "Imawesome@gmail.com"
		And I should see "1985"
