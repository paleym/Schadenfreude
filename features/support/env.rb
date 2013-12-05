require 'rspec/expectations'
require 'cucumber/rails'

Capybara.default_selector = :css
World(RSpec::Matchers)
