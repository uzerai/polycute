# frozen_string_literal: true

class FunctionalityController < ApplicationController
  skip_forgery_protection

  def index
    render json: Functionality.all
  end

  def register
    json = JSON.parse(request.raw_post)

    functionality = Functionality.new \
      name: json["name"].upcase,
      route: json["route"].downcase,
      uuid: SecureRandom.uuid,
      variable_object: json["variable_object"],
      registration_payload: json

    functionality.save if functionality.valid?

    response = {
      data: functionality,
      errors: functionality.errors
    }

    render json: response.to_json
  end

end