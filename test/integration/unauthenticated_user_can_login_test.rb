require 'test_helper'

class UnauthenticatedUserCanLoginTest < ActionDispatch::IntegrationTest

 test "unauthenticated user is redirected to login page and successfully signs in" do
   user = User.create(email: "tyler@tyler.com", password: "password")
   visit '/'

   assert_equal "/login", current_path

   fill_in "Email", with: user.email
   fill_in "Password", with: "password"
   click_button "Login"

   assert_equal task_lists_path, current_path
 end
end
