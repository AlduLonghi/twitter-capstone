class FollowingsController < ApplicationController
  before_action :authenticate_user!

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
