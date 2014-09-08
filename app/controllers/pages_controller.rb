class PagesController < ApplicationController

    def index
        @memes = Meme.where(isprivate: false).order('created_at DESC').page(params[:page]).per(5)
    end


end
