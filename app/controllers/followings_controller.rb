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

  def new; end

  def create
    @following = current_user.followings.build(followed_id: params[:id])
    redirect_back(fallback_location: root_path) if @following.save
  end

  def show; end

  def destroy
    @following = Following.where(follower_id: current_user.id, followed_id: params[:id]).first
    @following.destroy
    redirect_back(fallback_location: root_path)
  end
end
