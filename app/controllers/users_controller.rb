class UsersController < ApplicationController
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params.require(:user).permit(:name))
    if @user.save
      redirect_to login_path
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @hosted_events = @user.hosted_events
  end
  
end
