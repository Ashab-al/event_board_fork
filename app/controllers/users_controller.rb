class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_current_user, except: [:show]

  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @signed_events = @user.subscriptions.map(&:event)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    User.find(params[:id]).destroy! 

    redirect_to users_url
  end

  private
    def set_current_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:name, :email, :about, :image)
    end
end
