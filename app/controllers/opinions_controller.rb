class OpinionsController < ApplicationController
    before_action :authenticate_user!

    def index

    end

    def create
        @opinion = current_user.opinions.build(opinion_params)

    end

    private

    def opinion_params
        params.require(:opinions).permit(:content)
    end

end
