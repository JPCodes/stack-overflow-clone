class UsersController < ApplicationController
  def index
    @users = User.all
    if !current_user.admin?
      redirect_to root_path
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
