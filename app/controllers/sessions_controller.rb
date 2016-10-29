class SessionsController < ApplicationController

	skip_before_filter :require_login

  def new
  end

  def create
		if user = User.find_by_email(params[:email])
			if user.authenticate(params[:password])
				session[:user_id] = user.id
				redirect_to root_path, flash: {success: 'Logged in.'}
			else
				redirect_to login_path, flash: {danger: 'Email or password is wrong.'}
			end
		else
			redirect_to login_path, flash: {danger: 'Email or password is wrong.'}
  	end
  end

  def destroy
  	session[:user_id] = nil
		redirect_to root_path, flash: {success: 'Logged out.'}
  end

end
