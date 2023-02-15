# frozen_string_literal: true

class ExecutionController < BaseController
  skip_forgery_protection

  def execute
    executor = FunctionalityExecutor.new \
      variables: JSON.parse(request.raw_post)['variables'],
      function_name: params[:function_name].upcase

    results = executor.execute

    render json: {
      results: results,
      errors: []
    }
  end
end