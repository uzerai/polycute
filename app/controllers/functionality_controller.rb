# frozen_string_literal: true

class FunctionalityController < ApplicationController
  skip_forgery_protection

  def index
    render json: Functionality.all
  end

  def execute
    executor = FunctionalityExecutor.new \
      JSON.parse(request.raw_post)['variables'],
      params[:function_name].upcase

    executor.execute
  end

end