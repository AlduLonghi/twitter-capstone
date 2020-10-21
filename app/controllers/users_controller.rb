class UsersController < ApplicationController
  def show
    @user = User.all.includes(:followers, :followed_users, :opinions, :favorites)
    @user = @user.find_by(id: params[:id])
    @users = @user.followers.take(10)
    @opinion = Opinion.new
  end
end
