class OptionsController < ApplicationController
  before_action :require_admin!
  before_action :set_option, only: [:edit, :update]

  def index
    @options = Option.all
  end

  def new
    @option = Option.new
  end

  def edit
  end

  def create
    @option = Option.new(option_params)
    respond_to do |format|
      if @option.save
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @option.save
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
        format.json { render json: @option.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def require_admin!
      if !helpers.current_user.try(:admin?)
        redirect_to menus_path
        flash[:alert] = "You must be an admin to view options."
      end
    end

    def set_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:description)
    end
end
