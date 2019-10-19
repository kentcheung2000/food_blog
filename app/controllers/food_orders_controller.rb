class FoodOrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @outing = Outing.find(params[:outing_id])
    @food_order = FoodOrder.new food_order_params
    @food_order.user = current_user
    @food_order.outing = @outing
    if @food_order.save
        redirect_to food_order_path(@outing)
    else
        @food_orders = @outing.food_orders.order(created_at: :desc)
        render 'outings/show'
    end
end

def destroy
    @outing = Outing.find params[:post_id]
    @food_order = FoodOrder.find params[:id]
    if can? :crud, @food_order
         @food_order.destroy
         redirect_to outing_path(@outing),
         notice: 'Food Order Deleted'
    else
        head :unathorized
    end
end

private

def food_order_params
    params.require(:food_order).permit(:description)
end



end
