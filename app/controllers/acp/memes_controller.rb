module Acp
    class MemesController < ApplicationController
        def index
          if (current_user.isadmin)
            @meme = Meme.all
        else
            flash[:error] = "Sie sind kein Administrator."
            redirect_to index_path
        end
    end

    def destroy
        @meme = Meme.all.find(params[:id])
        @meme.destroy
        File.delete('public/uploads/generated_memes/' + @meme.id.to_s + '.jpg')
        flash[:success] = "Meme wurde gelöscht"
        redirect_to acp_memes_path
    end

end
end