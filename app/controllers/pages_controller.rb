class PagesController < ApplicationController

    def index
        if params[:tag]
            @memes = Meme.where(isprivate: false).tagged_with(params[:tag]).order('created_at DESC').page(params[:page]).per(5)
        else
            @memes = Meme.where(isprivate: false).order('created_at DESC').page(params[:page]).per(5)
        end
    end

    def search
        @memes = Meme.where(isprivate: false).tagged_with(search_params[:search]).order('created_at DESC').page(params[:page]).per(5)
        @search_tag = search_params[:search]
    end

private
    def search_params
        params.permit(:search)
    end

end
