class PagesController < ApplicationController

    def index
        @memes = Meme.all
    end

private
    def pages_params
        params.require('pages')
        .permit(:start, :end)
    end

end
