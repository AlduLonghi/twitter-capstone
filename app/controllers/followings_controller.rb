class FollowingsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    @following = current_user.followings.build(followed_id: params[:id])
    if @following.save
    redirect_to root_path
    end
  end

  def show

  end

  def destroy
    @following = Following.where(follower_id: current_user.id, followed_id: params[:id])
    @following.destroy
  end
end
