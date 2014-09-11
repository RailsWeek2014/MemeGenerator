class CommentsController < ApplicationController

    def create
        @meme = Meme.find params[:meme_id]
        if current_user != nil

            if comment_params[:comment].length > 9 && comment_params[:comment].length < 200
                @comment = Comment.new(comment_params)
                @comment.commentable = @meme
                @comment.user = current_user
                if @comment.save
                    flash[:success] = "Kommentar wurde angelegt"
                    redirect_to @meme
                end
            else
                flash[:error] = "Das Kommentar muss zwischen 10 und 200 Zeichen lang sein."  
                redirect_to @meme  
            end

            
        else 
            flash[:error] = "Nicht eingeloggt"  
            redirect_to @meme          
        end
    end


    private
    def comment_params
        params.require('comment')
        .permit(:comment)
    end

end
