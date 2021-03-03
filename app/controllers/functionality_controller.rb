# frozen_string_literal: true

class FunctionalityController < BaseController
  skip_forgery_protection

  def index
    render json: Functionality.all
  end

  def register
    json = JSON.parse(request.raw_post)

    functionality = Functionality.new \
      name: json['name'].upcase,
      route: json['route'].downcase,
      uuid: SecureRandom.uuid,
      variable_object: json['variable_object'],
      function_definition: json['function_definition'],
      registration_payload: json

    functionality.save if functionality.valid?

    response = {
      data: functionality,
      errors: functionality.errors
    }

    render json: response
  end

  def update
    json = JSON.parse(request.raw_post)

    functionality = Functionality.find_by(name: json['name'].upcase)

    fail NotFoundException 'Functionality not found' unless functionality.present?

    functionality.update! \
      name: json['name'].upcase,
      route: json['route'].downcase,
      uuid: SecureRandom.uuid,
      variable_object: json['variable_object'],
      function_definition: json['function_definition'],
      registration_payload: json

    response = {
      data: functionality,
      errors: functionality.errors
    }

    render json: response
  end

  def destroy
		functionality = Functionality.find(params[:id])

		fail NotFoundException 'Functionality not found' unless functionality.present?

		functionality.destroy!

		response = {
			data: functionality,
			errors: functionality.errors
		}

		render json: response
	end
end
