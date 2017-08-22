class SessionsController < ApplicationController
  def new
  end
  
  def create
    @user = User.find_by(name: params[:session][:name])
    if @user
      session[:user_id] = @user.id
      redirect_to user_path @user
    else
      flash.now[:danger] = 'No user found'
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil if logged_in?
    redirect_to login_path
  end
  
end
