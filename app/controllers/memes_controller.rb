require 'RMagick'
include Magick
require 'rmagick_text_util.rb'
include RMagickTextUtil

class MemesController < ApplicationController

    def new
        @meme = Meme.new
        #if MemeTemplate.all.count == 0
        #    flash[:error] = "Fehler: Keine Templates verfügbar"
        #    redirect_to index_path
        #end
    end

    def create
        @meme = Meme.new(meme_params)
         if @meme.save 
            if (current_user != nil)
                current_user.memes << @meme  
            end
            Imagemagick_Modul.make_meme(meme_params[:textoben], meme_params[:textunten], meme_params[:template_id], @meme.id)
            redirect_to meme_path(@meme.id.to_s)
        else                    
            render action: "new"
        end 
    end

    def list
        if (current_user != nil)
            @memes = current_user.memes.order('created_at DESC').page(params[:page]).per(3)
        else
            redirect_to index_path
        end

    end

    def show
        @meme = Meme.find(params[:id])
        @comment = Comment.new(commentable:@meme)
    end

    def delete
        @meme = current_user.memes.find(params[:id])
        @meme.destroy
        File.delete('public/uploads/generated_memes/' + @meme.id.to_s + '.jpg')
        flash[:success] = "Meme wurde gelöscht"
        redirect_to list_meme_path
    end



    private
    def meme_params
        params.require('meme')
        .permit(:title, :description, :textoben, :textunten, :template_id, :isprivate, :comment, :tag_list)
    end
end