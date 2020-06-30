class MenusController < ApplicationController
  before_action :set_menu, only: [:show]
  
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new
    @menu.menu_options.build
  end

  def create
    @menu = Menu.new(menu_params)

    respond_to do |format|
      if @menu.save
        format.html { redirect_to menus_path, notice: 'Menu was successfully created' }
        format.json { render :index, status: :created }
      else
        format.html { render :new }
        format.json { render json: @menu.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_menu
      @menu = Menu.find(params[:id])
    end

    def menu_params
      params.require(:menu).permit(:id, :date, option_ids: [])
    end
end
