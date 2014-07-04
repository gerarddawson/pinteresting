class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :current_user, only: [:edit, :update, :destroy]

  def index
    @pins = Pin.all
  end


  def show
    @pin = Pin.find(params[:id])
  end

  def new
    @pin = Pin.new
  end

  def edit
  end

  def create
    @pin = Pin.new(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Pin was successfully created.' 
    else
      render action: 'new' 
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Pin was successfully updated.' 
    else
      render action: 'edit' 
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

  
    def pin_params
      params.require(:pin).permit(:description, :image)
    end
end