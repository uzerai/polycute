# frozen_string_literal: true

class RegistrationController < ApplicationController
  skip_forgery_protection

  def index
    render json: Functionality.all.to_json
  end

  def create
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
