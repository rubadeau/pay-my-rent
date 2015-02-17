class UsersController < ApplicationController

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was successfully created"
      redirect_to users_path(@user)
    else
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:name, :email)
  end


end