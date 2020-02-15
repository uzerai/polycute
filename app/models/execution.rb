# frozen_string_literal: true

class Execution

  def initialize(functionality:, arguments:)
    @arguments = arguments
    @functionality = functionality

    build_dependencies
  end

  def self.execute(functionality:, arguments:)
    execution = Execution.new \
      functionality: functionality, arguments: arguments

    execution.execute_function
  end

  def build_dependencies
    @arguments.each do |argument, value|
      instance_variable_set('@' + argument, value) \
        unless instance_variable_defined?('@' + argument)
    end
  end

  def execute_function
    @result = eval @functionality.function_definition, binding
  end
end