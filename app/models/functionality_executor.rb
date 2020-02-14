# frozen_string_literal: true

class FunctionalityExecutor
  def initialize(variables, function_name)
    @variables = variables
    @function = Functionality.find_by(name: function_name)
  end

  def execute
    p "Executing functionality: #{@function.name}" if valid?
  end

  private

  def valid?
    raise(NotImplementedError, 'No function with that name.') if @function.nil?
    raise(ArgumentError, 'Supplied variables were fucked') unless variables_valid?

    true
  end

  def variables_valid?
    return false unless \
      @function.variable_object.keys.length == @variables.keys.length

    @function.variable_object.each do |variable, format|
      return false unless variable_valid? variable, format
    end

    true
  end

  def variable_valid?(variable, format)
    value_type = @variables[variable].class

    case format
    when 'number'
      value_type == Integer || Float || Double
    when 'string'
      value_type == String
    else
      false
    end

  end
end
