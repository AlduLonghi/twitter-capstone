class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: params[:user_id])
    if params[:users] == 'followers'
      @followings = @user.followers
      @heading_word = 'followers'
    else
      @followings = @user.followed_users
      @heading_word = 'followed users'
    end
  end

  def create
    @following = current_user.followings.build(followed_id: params[:id])
    if @following.save
      redirect_back(fallback_location: root_path) 
    else
      redirect_to root_path
      flash[:alert] = "Oops, something went wrong"
  end

  def destroy
    @following = Following.where(follower_id: current_user.id, followed_id: params[:id]).first
    @following.destroy
    redirect_back(fallback_location: root_path)
  end
end
