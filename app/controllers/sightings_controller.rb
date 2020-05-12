# frozen_string_literal: true

class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: sightings.to_json(
      except: %i[updated_at],
      include: {
        bird: { only: %i[name species] },
        location: { only: %i[latitude longitude] }
      }
    )
  end

  def show
    sighting = Sighting.find_by_id(params[:id])
    render json: sighting.to_json(
      except: %i[updated_at],
      include: {
        bird: { only: %i[name species] },
        location: { only: %i[latitude longitude] }
      }
    )
  end
end
