module Acp
  class UsersController < ApplicationController
    def index
      if (current_user.isadmin)
        @user = User.all
      else
        flash[:error] = "Sie sind kein Administrator."
        redirect_to index_path
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
     @user = User.find(params[:id])
     params[:user].delete :password if params[:user][:password].empty?
     if @user.update(user_params)
     redirect_to acp_users_path, :notice => "User updated successfully."
   else
     render :edit
   end
 end


   def destroy
    @users = User.find(params[:id])
    @users.destroy
    redirect_to acp_users_path
    flash[:success] = "Benutzer wurde gelöscht"
  end

  private
  def user_params
    params.require('user')
    .permit("username", "email", "password", "isadmin")
  end

end
end