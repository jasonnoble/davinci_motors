class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def new
    @car = Car.new
  end

  def edit
    # Fetch the car from the model
    # Store it
    # Hand it off to the view
    @car = Car.find(params[:id])
  end

  def create
    car = Car.new(car_params)
    message = "#{car.year} #{car.make} #{car.model} created"
    if car.save
      redirect_to root_path,
        notice: message
    else
      render :new
    end
  end

  def update
    car = Car.find(params[:id])
    message = "#{car.year} #{car.make} #{car.model} updated"
    if car.update(car_params)
      redirect_to root_path,
        notice: message
    else
      render :new
    end
  end

  def car_params
    params.require(:car).permit(:make, :model, :year, :price)
  end
end
