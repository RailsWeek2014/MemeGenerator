module Acp
    class UsersController < ApplicationController
        def index
            if (current_user.isadmin)
                @users = User.all
            else
                redirect_to index_path
            end
        end

        def edit

        end

        def destory
            @users = User.find(params[:id])
            @users.destroy
        end
        
    end
end