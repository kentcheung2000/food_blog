class OutingsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  # before_action :find_outing, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @outings = Outing.order(created_at: :desc)
  end

  def show

    @outing = Outing.find(params[:id]) 
    
    @food_orders = @outing.food_orders(created_at: :desc)
    #@food_order = FoodOrder.new
    # byebug
    

  end

  def new
  end

  def create
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

  

end
