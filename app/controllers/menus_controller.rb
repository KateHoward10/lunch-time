class MenusController < ApplicationController
  before_action :require_user!
  before_action :set_menu, only: [:edit, :update]
  
  def index
    @menus = Menu.where(organisation: helpers.current_user.organisation)
  end

  def new
    @menu = Menu.new
    @menu.menu_options.build
  end

  def edit
  end

  def create
    @menu = Menu.new(menu_params)
    @menu.organisation = helpers.current_user.organisation
    respond_to do |format|
      if @menu.save
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @menu.update
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def require_user!
      if !helpers.logged_in?
        redirect_to root_path
        flash[:alert] = "You must be logged in to view menus."
      end
    end

    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:id, :date, option_ids: [])
    end
end
