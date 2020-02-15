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
    raise(NotImplementedError, 'No function with that name.') if @function.nil?
    raise(ArgumentError, 'Supplied variables were fucked') unless variables_valid?

    true
  end

  def variables_valid?
    validator = ArgumentValidator.new \
      @function.variable_object, @variables
    validator.valid?
  end
end
