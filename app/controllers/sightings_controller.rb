class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      bird = sighting.bird
      location = sighting.location
      render json: sighting, include: [:bird, :location]
    else
      render json: {message: "Could not find sighting with an ID of #{params[:id]}"}
    end
  end
end
