# frozen_string_literal: true

class ExecutionController < ApplicationController
  skip_forgery_protection

  def execute
    executor = FunctionalityExecutor.new \
      JSON.parse(request.raw_post)['variables'],
      params[:function_name].upcase

    executor.execute
  end

end