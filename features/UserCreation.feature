#encoding: utf-8
Feature: Create a new User of Schadenfreude
	In order to verify that new users can be created, saved in the database and 
	As a Schadenfreude user, so that I can interact with others,
	I want to be able to create a profile with basic personal information about myself.
	
	Scenario: Creating a new User
		Given I am on the Schadenfreude home page
		When I press "Add New User"
		Then I should see "Create a New User Profile"
		When I fill in "firstName" with "Will"
		And I fill in "lastName" with "Mortle"
		And I select "10" from "birthday"
		And I select "11" from "birthday"
		And I select "1985" from "birthday"
		And I fill in "email" with "Imawesome@gmail.com"
		And I fill in "password" with "blup"
		And I press "Create Profile"
		Then I should be on 'Index'
		And I should see "Will"
		And I should see "Mortle"
		And I should see "Imawesome@gmail.com"
		And I should see "1985"
