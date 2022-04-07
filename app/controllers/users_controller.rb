class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_user, except: [:show, :index]
  before_action :authorize_user, except: [:show, :index]

  def index
    @users = User.order(created_at: :desc)
    authorize @users
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
    @user.destroy! 

    redirect_to users_url
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def authorize_user
      authorize @user
    end

    def user_params
      params.require(:user).permit(:name, :email, :about, :image)
    end
end
