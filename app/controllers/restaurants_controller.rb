class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :destroy, :edit, :update]
  
  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'new'
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url
  end

  def show
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category )
  end
end