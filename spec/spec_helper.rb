require 'simplecov'
SimpleCov.start :rails do
  add_filter 'config/initializers'
end

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

RSpec.configure do |config|

  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = "random"

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end