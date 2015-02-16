class SessionsController < ApplicationController

  def login

  end

  def create
    p "*{" * 80
    @user = User.find_by_email(params[:email])
    p @user
    p @user.password
    p params[:password]
    if @user.password == params[:password_hash]
      p "login success"
      session[:id] = @user.id
      redirect_to slides_path
    else
      p "login success"
      redirect_to login_path
    end
    p session[:id]
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end

end
