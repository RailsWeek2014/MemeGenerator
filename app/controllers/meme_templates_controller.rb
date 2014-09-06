class MemeTemplatesController < ApplicationController

    def new
        @meme_template = MemeTemplate.new
    end

    def create
        @meme_template = MemeTemplate.new(meme_template_params)
         if @meme_template.save 
            redirect_to newmeme_path
        else
            render action: "new"
        end 
    end

    def delete

    end

    def show
        @meme_template = MemeTemplate.find(params[:id])
    end

    private
    def meme_template_params
        params.require('meme_template')
        .permit(:title, :template_img)
    end
end
