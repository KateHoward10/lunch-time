class SessionsController < ApplicationController

  def omniauth
    @user = User.from_omniauth(auth)
    session[:user_id] = @user.id
    user_exists = !!(User.where(email: @user.email) && @user.organisation)
    @user.save
    redirect_to user_exists ? menus_path : new_organisation_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private
    def auth
      request.env['omniauth.auth']
    end
end