require 'RMagick'
include Magick
require 'rmagick_text_util.rb'
include RMagickTextUtil

class MemesController < ApplicationController

    def new
        @meme = Meme.new
    end

    def create
        @meme = Meme.new(meme_params)

         if @meme.save 
            MemesHelper.make_meme(meme_params[:textoben], meme_params[:textunten], meme_params[:template_id], @meme.id)
        
            redirect_to meme_path(@meme.id.to_s)
        else                    
            render action: "new"
        end 
    end

    def delete

    end

    def show
        @meme = Meme.find(params[:id])
    end

    private
    def meme_params
        params.require('meme')
        .permit(:title, :description, :textoben, :textunten, :template_id)
    end
end