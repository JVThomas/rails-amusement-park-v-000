class AttractionsController < ApplicationController
  before_action :set_attraction, only:[:show,:edit,:update]
  
  def index
    @attractions = Attraction.all
  end

  def show
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      redirect_to attraction_path(@attraction)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @attraction.update(attraction_params) if !@attraction.nil?
    redirect_to attraction_path(@attraction)
  end

  private
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :nausea_rating, :happiness_rating, :tickets, :min_height)

    end

end