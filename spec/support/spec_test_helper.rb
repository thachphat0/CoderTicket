module SpecTestHelper
  def login(user = User.new)
    request.session[:user_id] = user.id
  end

  def current_user
    User.find(request.session[:user_id])
  end
end

# spec/spec_helper.rb
RSpec.configure do |config|
  config.include SpecTestHelper, :type => :controller
end