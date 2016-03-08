require 'test_helper'

class TaskListTest < ActiveSupport::TestCase
  test "link is invalid without valid url or title" do
    link = Link.new(url: "Testing validation")
    valid_link = Link.new(title: 'cool', url: "http://espn.go.com")

    refute link.valid?
    assert valid_link.valid?
  end

  test "link belongs to a user" do
    user = User.create(email: "tyler@tyler.com", password: "password")
    link = Link.create(title: "espn", url: "go tigers")
    user.links << link

    assert_equal user.links.first, link
  end
end
