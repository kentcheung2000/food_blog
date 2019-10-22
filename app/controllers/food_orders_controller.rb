class FoodOrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_outing
  before_action :find_food_order, only: [:destroy, :update]
  before_action :authorize_user!, only: [:destroy]

  
    def create
        
        @food_order = FoodOrder.new food_order_params
        @food_order.outing = @outing
        @food_order.user = current_user
        #byebug
       
     
        if @food_order.save
            #flash[:success] = "Comment added!"
        else
            @food_orders = @outing.food_orders.order(created_at: :desc)
            #flash[:alert] = @comment.errors.full_messages.join(", ")
        end

        redirect_to @outing
    end

    def destroy
        @food_order.destroy 
        #flash[:success] = "Food Order deleted"
        redirect_to @food_order.outing
    
    end

    private

    def find_food_order
        @food_order = FoodOrder.find params[:id]
    end

    def find_outing
        @outing = Outing.find params[:outing_id]
    end

    def food_order_params
        params.require(:food_order).permit(:restaurant_food_id)
    end



end
