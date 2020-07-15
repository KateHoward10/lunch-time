class UsersController < ApplicationController
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
    def user_params
      params.require(:user).permit(:email)
    end
end