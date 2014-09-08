module Acp
    class UsersController < ApplicationController
        def index
            if (current_user.isadmin)
                @user = User.all
            else
                flash[:error] = "Sie sind kein admin"
                redirect_to index_path
            end
        end

        def edit

        end

        def destroy
            @users = User.find(params[:id])
            @users.destroy
            redirect_to acp_users_path
            flash[:success] = "Benutzer wurde gelöscht"
        end
        
    end
end