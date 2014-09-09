class CommentsController < ApplicationController

    def create
        @meme = Meme.find params[:meme_id]
        if current_user != nil
            @comment = Comment.new(comment_params)
            @comment.commentable = @meme
            @comment.user = current_user
            if @comment.save
                flash[:success] = "Comment wurde angelegt"
                redirect_to @meme
            end
        else 
            flash[:error] = "nicht eingeloggt"  
            redirect_to @meme          
        end
    end


    private
    def comment_params
        params.require('comment')
        .permit(:comment)
    end

end
