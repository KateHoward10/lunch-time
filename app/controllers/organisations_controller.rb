class OrganisationsController < ApplicationController
  
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
        @user.save
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
        format.json { render json: @organisation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def organisation_params
      params.require(:organisation).permit(:name)
    end
end
