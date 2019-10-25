class RestaurantFoodsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_restaurant_food
  before_action :find_restaurant
  
 
    def create
        
        @restaurant_food = RestaurantFood.new restaurant_food_params
        @restaurant_food.restaurant = @restaurant
      
        if @restaurant_food.save
            #flash[:success] = "Food added!"
        else
            @restaurant_foods = @restaurant.restaurant_foods.order(created_at: :desc)
            #flash[:alert] = @restaurant_food.errors.full_messages.join(", ")
        end

        redirect_to @restaurant
    end

    def destroy
        @restaurant_food.destroy 
        #flash[:success] = "restaurant food deleted"
        redirect_to @restaurant_food.restaurant
    
    end

    private

    def find_restaurant_food
        @restaurant_food = RestaurantFood.find params[:id] if params[:id].present?
    end

    def find_restaurant
        @restaurant = Restaurant.find params[:restaurant_id] if params[:restaurant_id].present?
    end

    def restaurant_food_params
        params.require(:restaurant_food).permit(:name, :description, :price, :restaurant_id, :food_picture)
    end




end
