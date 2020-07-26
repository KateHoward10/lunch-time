class OrganisationsController < ApplicationController
  before_action :require_admin!
  
  def new
    @organisation = Organisation.new
  end

  def edit
  end

  def create
    @organisation = Organisation.new(organisation_params)
    respond_to do |format|
      if @organisation.save
        @user = helpers.current_user
        @user.organisation = @organisation
        @user.admin = true
        @user.save
        format.html { redirect_to menus_path }
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def require_admin!
      if !helpers.current_user.try(:admin?)
        redirect_to menus_path
        flash[:alert] = "You must be an admin to edit organisations."
      end
    end

    def organisation_params
      params.require(:organisation).permit(:name)
    end
end
