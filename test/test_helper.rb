ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'minitest/unit'
require 'capybara/rails'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
  include Rails.application.routes.url_helpers

  DatabaseCleaner.strategy = :truncation
  self.use_transactional_fixtures = false

  def setup
    DatabaseCleaner.start
  end

  def teardown
    DatabaseCleaner.clean
  end

  def create_user
    visit root_path
    assert_equal "/", current_path

    assert page.has_content?("Sign Up")

    click_on "Sign Up"

    assert_equal "/users/new", current_path

    fill_in 'Username', with: 'tyler'
    fill_in 'Email address', with: 'tyler@tyler.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_on 'Create Account'
  end
end
