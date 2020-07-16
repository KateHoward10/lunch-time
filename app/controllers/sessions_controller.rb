class SessionsController < ApplicationController

  def omniauth
    is_in_org = User.is_in_org(auth)
    @user = User.from_omniauth(auth)
    session[:user_id] = @user.id
    @user.save
    redirect_to is_in_org ? menus_path : new_organisation_path
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