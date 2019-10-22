class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def index
    @restaurants = Restaurant.order(created_at: :desc)
  end

  def create
  end

  def show
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private









end
