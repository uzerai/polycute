# frozen_string_literal: true

require_relative 'validation/argument_validator.rb'

class FunctionalityExecutor
  include Validations

  def initialize(variables:, function_name:)
    @variables = variables
    @function = Functionality.find_by(name: function_name)
  end

  def execute
    Execution.execute functionality: @function, arguments: @variables if arguments_valid?
  end

  private

  def arguments_valid?
    fail NotImplementedError, 'No function with that name.' if @function.nil?

    # TODO: Add support for individual-field demarkation of error (can't be nil / invalid format)
		fail ArgumentError, 'Arguments provided do not match arguments expected.' unless variables_valid?

    true
  end

  def variables_valid?
    validator = ArgumentValidator.new \
      @function.variable_object, @variables
    validator.valid?
  end
end
