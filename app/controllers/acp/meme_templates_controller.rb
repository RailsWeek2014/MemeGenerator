module Acp
    class MemeTemplatesController < ApplicationController
        def index
            if (current_user.isadmin)
                @meme_templates = MemeTemplate.all.page(params[:page]).per(6)
            else
                flash[:error] = "Sie sind kein Administrator."
                redirect_to index_path
            end
        end

        def destroy
            @meme_template = MemeTemplate.all.find(params[:id])
            @meme_template.destroy
            flash[:success] = "Vorlage wurde gelöscht"
            redirect_to acp_meme_templates_path
        end

    end
end