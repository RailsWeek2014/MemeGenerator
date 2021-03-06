module Acp
  class UsersController < ApplicationController
    def index
      if current_user != nil
        if (current_user.isadmin)
          @users = User.all.page(params[:page]).per(6)
        else
          flash[:error] = "Sie sind kein Administrator."
          redirect_to index_path
        end
      else
          flash[:error] = "Nicht eingeloggt."
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
       redirect_to acp_users_path, :notice => "Benutzer wurde Erfolgreich bearbeitet."
     else
       render :edit
     end
    end


   def destroy
    if (current_user.id == params[:id].to_i)
      redirect_to acp_users_path
      flash[:error] = "Du kannst dich nicht selber löschen"
    else
      @user = User.find(params[:id])
      @user.destroy
      redirect_to acp_users_path
      flash[:success] = "Benutzer wurde gelöscht"
    end

   end

  private
  def user_params
    params.require('user')
    .permit("username", "email", "password", "isadmin")
  end

end
end