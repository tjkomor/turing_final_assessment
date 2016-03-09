require 'test_helper'

class UserCanAddLinkToListTest < ActionDispatch::IntegrationTest

  test "user can create list" do
    skip
    user = User.create(email: "tyler@tyler.com", password: "password")
    visit login_path
    fill_in "Email", with: user.email
    fill_in "Password", with: "password"
    click_button "Login"

    fill_in "Title", with: "ESPN"
    fill_in "Url", with: "http://espn.go.com"

    click_button "Create New Link"

    assert page.has_content?("ESPN")
    assert page.has_content?("Link created!")

    click_button "New List"

    fill_in "Title", with: "First List"

    click_button "Submit"

    click_button "add to list"

    click_link "First List"



    assert_equal links_path, current_path


  end
end
