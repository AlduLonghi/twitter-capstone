class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @user.followers.where.not(id: current_user.id).take(10)
    @opinion = Opinion.new
  end
end
