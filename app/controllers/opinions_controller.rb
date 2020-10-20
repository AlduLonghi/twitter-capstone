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

  private

  def opinions_timeline
    ids = current_user.followed_users.pluck(:id) << current_user.id
    @opinions_timeline = Opinion.where(author_id: ids).most_recent_opinions
  end

  def opinion_params
    params.require(:opinion).permit(:content)
  end
end
