class AttractionsController < ApplicationController
  before_action :set_attraction!, only: [:show, :edit, :update, :ride]

  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.create(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  def edit
  end

  def update

  end

  def ride
    @ride = Ride.new(attraction_id: @attraction.id, user_id: current_user.id)
    if flash[:message] = @ride.take_ride
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def destroy
  end

  private

  def set_attraction!
    @attraction = Attraction.find(params[:id])
  end

  def attraction_params
    params.require(:attraction).permit(:name, :min_height, :happiness_rating, :nausea_rating, :tickets)
  end
end
