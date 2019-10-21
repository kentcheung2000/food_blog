class OutingsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  # before_action :find_outing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @outings = Outing.order(created_at: :desc)
  end

  def show

    @outing = Outing.find(params[:id]) 
    @food_orders = @outing.food_orders.order(created_at: :desc)
    #@food_orders = @outing.restaurant.restaurant_foods
    
  end

  def new
    @outing = Outing.new
  end

  def create
    @outing = Outing.new outing_params
    @outing.user = current_user
    if @outing.save
      # byebug
      #flash[:success] = "Outing created!"
      redirect_to @outing
    else
      #flash.now[:alert] = @outing.errors.full_messages.", "
      render :new
    end
  end

  def edit
  end

  def update
    
  end

  def destroy
  end

  private

  def find_outing
    @outing = Outing.find(params[:id]) 
  end

  def outing_params
    params.require(:outing).permit(:description, :meeting_date, :meeting_time, :total, :restaurant_id)
    
  end

  

end
