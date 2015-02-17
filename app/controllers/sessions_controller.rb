class SessionsController < ApplicationController

  def login

  end

  def create

    @user = User.find_by_email(params[:email])

    if @user.password == params[:password_hash]
      # p "login success"
      session[:id] = @user.id
      redirect_to slides_path
    else
      # p "login failed"
      redirect_to login_path
    end

  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end

end
