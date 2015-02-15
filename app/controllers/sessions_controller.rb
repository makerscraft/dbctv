class SessionsController < ApplicationController

  def login

  end

  def create
    p "*{" * 80
    @user = User.find_by_email(params[:email])
    p @user
    p params[:password]
    if @user.password == params[:password_hash]
      session[:id] = @user.id
    end
    p session[:id]
    redirect_to root_path
  end

  def destroy
    session[:id] = nil
    redirect_to root_path
  end

end
