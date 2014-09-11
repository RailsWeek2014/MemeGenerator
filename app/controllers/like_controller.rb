class LikeController < ApplicationController
  def like
    @meme = Meme.find params[:meme_id]
    if current_user != nil
        current_user.like!(@meme)
        redirect_to @meme
    else 
        redirect_to @meme
    end

end

def unlike
    @meme = Meme.find params[:meme_id]
    if current_user != nil
        current_user.unlike!(@meme)
        redirect_to @meme
    else
        redirect_to @meme
    end
end

end