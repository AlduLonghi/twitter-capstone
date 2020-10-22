class UsersController < ApplicationController
  def show
    @users = User.includes(:followers, :followed_users, :opinions, :favorites)
    @user = @users.find_by(id: params[:id])
    @followed_by = @user.followers.where.not(id: current_user.id).take(10)
    @opinion = Opinion.new
  end
end
