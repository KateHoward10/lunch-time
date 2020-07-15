class SessionsController < ApplicationController

  def omniauth
    @user = User.from_omniauth(auth)
    session[:user_id] = @user.id
    if User.find(@user.id) && @user.organisation
      redirect_to menus_path
    else
      @user.save
      redirect_to new_organisation_path
    end
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