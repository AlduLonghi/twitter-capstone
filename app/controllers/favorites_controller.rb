class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: params[:user_id])
    @favorites = @user.favorite_opinions
  end

  def create
    @favorite = current_user.favorites.build(opinion_id: params[:opinion_id])
    if @favorite.save
      redirect_back(fallback_location: root_path) 
    else
      flash[:notice] = "Ups, something went wrong"
      redirect_to root_path
    end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, opinion_id: params[:id])
    @favorite.destroy
    redirect_back(fallback_location: root_path)
  end
end
