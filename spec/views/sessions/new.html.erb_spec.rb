require 'rails_helper'

RSpec.describe "sessions/new.html.erb", type: :view do

  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :password => "MyString"
    ))
  end

  it "renders login form" do
    render

    assert_select "form[action=?][method=?]", sessions_path, "post" do

      assert_select "input#email[name=?]", "user[email]"

      assert_select "input#password[name=?]", "user[password]"
    end
  end
end
