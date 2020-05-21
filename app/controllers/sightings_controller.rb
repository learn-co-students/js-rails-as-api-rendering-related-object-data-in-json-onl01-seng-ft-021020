class SightingsController < ApplicationController
    def show
        sighting = Sighting.find_by_id(params[:id])
        render json: sighting, include: [:bird, :location]
    end
end
