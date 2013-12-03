#encoding: utf-8
Feature: Create a new User of Schadenfreude
	In order to verify that new users can be created, saved in the database and 
	As a Schadenfreude user, so that I can interact with others,
	I want to be able to create a profile with basic personal information about myself.
	
	Scenario: Creating a new User
		Given that I am on the Schadenfreude Home Page
		When I press "Add New User"
		Then I should be on "Create a New User Profile"
		And both are 15 cm long

