class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
   @favorite = current_user.favorites.build(opinion_id: params[:opinion_id])
   if @favorite.save
    redirect_to root_path
   end
  end

  def destroy
    @favorite = Favorite.find_by(user_id: current_user.id, opinion_id: params[:id])
    @favorite.destroy
    redirect_to root_path
  end

end
