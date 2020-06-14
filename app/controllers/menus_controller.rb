class MenusController < ApplicationController
  before_action :set_menu, only: [:show]
  
  def index
    @menus = Menu.all
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new(menu_params)
    respond_to do |format|
      if @menu.save
        format.html { redirect_to @menu, notice: 'Menu was successfully created' }
        format.json { render :show, status: :created, location: @menu }
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
      params.require(:menu).permit(:date)
    end
end
