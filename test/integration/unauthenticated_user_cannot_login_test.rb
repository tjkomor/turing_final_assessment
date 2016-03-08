require 'test_helper'

class UnauthenticatedUserCannotLoginTest < ActionDispatch::IntegrationTest

  test "unauthenticated user is redirected to login page after entering an invalid password" do
    user = User.create(email: "tyler@tyler.com", password: "password")
    visit root_path

    refute page.has_content?("Invalid login")
    assert_equal "/login", current_path

    fill_in "Email", with: user.email
    fill_in "Password", with: "wrong password yo"
    click_button "Login"

    assert_equal "/login", current_path
    assert page.has_content?("Invalid login")
  end

  test "unauthenticated user is redirected to login page after entering an invalid email" do
    user = User.create(email: "tyler@tyler.com", password: "password")
    visit root_path

    refute page.has_content?("Invalid login")
    assert_equal "/login", current_path

    fill_in "Email", with: "notmyemail.com"
    fill_in "Password", with: "password"
    click_button "Login"

    assert_equal "/login", current_path
    assert page.has_content?("Invalid login")
  end
end
