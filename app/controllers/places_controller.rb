class PlacesController < ApplicationController
  def index
    places = Place.all
    render json: places
  end

  def show
    place = Place.find_by(id: params["id"])
    render json: place
  end

  def create
    place = Place.new(
      name: params["name"],
      address: params["address"],
    )

    if place.save
      render json: place
    else
      render json: { errors: place.errors.full_messages }, status: 406
    end
  end

  def update
    place = Place.find_by(id: params["id"])

    place.name = params["name"] || place.name
    place.address = params["address"] || place.address

    if place.save
      render json: place
    else
      render json: { errors: place.errors.full_messages }, status: 406
    end
  end

  def destroy
    place = Place.find_by(id: params["id"])
    place.destroy

    render json: { message: "Address Destroyed From Database" }
  end
end