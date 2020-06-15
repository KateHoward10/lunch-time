class OptionsController < ApplicationController
  before_action :set_option, only: [:show]

  def index
    @options = Option.all
  end

  def show
  end

  def new
    @option = Option.new
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

  private
    def set_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:description)
    end
end
