# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @items = @user.items.page(params[:page]).per(3)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update!(user_params)
    redirect_to current_user
  end

  def followings
    @user = User.find(params[:id])
    @users = @user.followings.page(params[:page]).per(20)
    render 'users/followings'
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.followers.page(params[:page]).per(20)
    render 'users/followers'
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
