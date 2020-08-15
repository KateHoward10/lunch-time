class OrdersController < ApplicationController
  before_action :require_user!
  before_action :set_order, only: [:edit, :update]
  
  def index
    @orders = Order.all
    dates = @orders.pluck(:date).uniq
    @order_lists = dates.map { |d| {date: d, orders: @orders.where(date: d)} }
  end

  def new
    @order = Order.new
    @menu = Menu.find(params[:menu])
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.user = helpers.current_user
    respond_to do |format|
      if @order.save
        format.html { redirect_to menus_path }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update
        format.html { redirect_to menus_path }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def require_user!
      if !helpers.logged_in?
        redirect_to root_path
        flash[:alert] = "You must be logged in to view orders."
      end
    end

    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:date, :option_id, :notes)
    end
end
