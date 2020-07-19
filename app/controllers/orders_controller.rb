class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update]
  
  def index
    @orders = Order.all
  end

  def new
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    @order.user = helpers.current_user
    respond_to do |format|
      if @order.save
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update
        format.html { redirect_to action: "index" }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:date, :notes)
    end
end
