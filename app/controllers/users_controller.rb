class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @users = @user.followers.take(10)
    @opinion = Opinion.new
  end
end
