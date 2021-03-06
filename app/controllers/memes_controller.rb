require 'RMagick'
include Magick

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
            Imagemagick_Modul.make_meme(meme_params[:text_up], meme_params[:text_down], meme_params[:template_id], @meme.id)
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
        if Meme.exists?(:id => params[:id])
            @meme = Meme.find(params[:id])
            @comment = Comment.new(commentable:@meme)
            @comments = Comment.all.where(commentable_id: @meme.id.to_s).page(params[:page]).per(6)
        else
            flash[:error] = "Meme mit dieser ID existiert nicht"
            redirect_to index_path
        end

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
        .permit(:title, :description, :text_up, :text_down, :template_id, :isprivate, :comment, :tag_list)
    end
end