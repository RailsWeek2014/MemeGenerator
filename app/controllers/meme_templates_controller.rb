class MemeTemplatesController < ApplicationController

    def new
        if (current_user != nil)
            @meme_template = MemeTemplate.new
        else
            flash[:error] = "Nicht eingeloggt"
            redirect_to index_path
        end
    end

    def create
        @meme_template = MemeTemplate.new(meme_template_params)
        if (current_user != nil)
            if @meme_template.save 
                flash[:success] = "Template wurde angelegt"
                current_user.meme_templates << @meme_template  
                redirect_to newtemplate_path
            else
                render action: "new"
            end 
        else
            flash[:error] = "Nicht eingeloggt"
            redirect_to index_path
        end
        
    end

    def list
        if (current_user != nil)
            @meme_templates = current_user.meme_templates
        else
            redirect_to index_path
        end

    end

    def delete
        @meme_template = current_user.meme_templates.find(params[:id])
        @meme_template.destroy
        flash[:success] = "Template wurde gelöscht"
        redirect_to list_meme_template_path
    end

    def show
        @meme_template = MemeTemplate.find(params[:id])
    end

    private
    def meme_template_params
        params.require('meme_template')
        .permit(:title, :template_img, :isprivate)
    end
end
