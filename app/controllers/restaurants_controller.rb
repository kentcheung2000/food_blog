class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.order(created_at: :desc)
  end

  def create
    @restaurant = Restaurant.new restaurant_params
    if @restaurant.save
     #flash[:success] = "Restaurant created!"
      redirect_to @restaurant
    else
      #flash.now[:alert] = @post.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    @restaurant_food = RestaurantFood.new
    @restaurant_foods = @restaurant.restaurant_foods.order(created_at: :desc)  
  end

  def edit
  end

  def update
    if @restaurant.update restaurant_params
      flash[:success] = "Restaurant updated!"
      redirect_to @restaurant
    else
      flash.now[:alert] = @restaurant.errors.full_messages.join(", ")
      render :edit
    end
  end


  def destroy
    @restaurant.destroy
    #flash[:success] = "Restaurant deleted"
    redirect_to restaurants_path
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:id]) 
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :longitude, :latitude)  
  end


end
