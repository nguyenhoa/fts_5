class Admin::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:session][:email].downcase
    if user && user.authenticate(params[:session][:password]) && admin_user?(user)
      sign_in user
      redirect_back_or admin_user_path(user)
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to admin_root_path
  end
end