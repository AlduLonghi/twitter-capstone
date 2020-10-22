class OpinionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @opinion = Opinion.new
    opinions_timeline
  end

  def new; end

  def create
    @opinion = current_user.opinions.build(opinion_params)
    if @opinion.save
      redirect_to root_path
    else
      opinions_timeline
      render :index
    end
  end

  def edit
    @opinion = Opinion.find_by(id: params[:id])
  end

  def update
    @opinion = Opinion.find_by(id: params[:id])
    if @opinion.update_attributes(opinion_params)
      redirect_to root_path
    else
      opinions_timeline
      render :edit
    end
  end

  def destroy
    @opinion = Opinion.find_by(id: params[:id])
    @opinion.destroy
    redirect_back(fallback_location: root_path)
  end

  def trends
    @today_trend = Opinion.today_trend.most_favorites.first(5)
    @week_trend = Opinion.week_trend.most_favorites.first(5)
    @historical = Opinion.most_favorites.first(5)
  end

  private

  def opinions_timeline
    ids = current_user.followed_users.pluck(:id) << current_user.id
    opinions = Opinion.all.includes(:author, :favorites)
    @opinions_timeline = opinions.where(author_id: ids).most_recent_opinions
  end

  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
