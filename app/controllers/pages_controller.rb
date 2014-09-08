class PagesController < ApplicationController

    def index
        #@memes = Meme.where("isprivate = 'false'").order('id').page(params[:page]).per(5)
        @memes = Meme.order('id').page(params[:page]).per(5)
    end


end
