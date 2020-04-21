class UsersController < ApplicationController
  include UsersHelper
  
  def new
  end

  def create
    # @user = User.new(user_params)
    @user = User.new(username: params[:username], email: params[:email], password: params[:password])

    if @user.save
      redirect_to new_user_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    user_params = { username: params[:username], email: params[:email], password: params[:password] }

    @user.update(user_params)

    redirect_to edit_user_path(@user)
  end
end
