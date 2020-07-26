class UsersController < ApplicationController
  before_action :require_admin!, except: [:index]
  def index
    @users = User.where(organisation: helpers.current_user.organisation)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.organisation = helpers.current_user.organisation
    respond_to do |format|
      if @user.save
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def require_admin!
      if !helpers.current_user.try(:admin?)
        redirect_to menus_path
        flash[:alert] = "You must be an admin to edit users."
      end
    end

    def user_params
      params.require(:user).permit(:email)
    end
end