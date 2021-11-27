# frozen_string_literal: true

class Execution

  # Wanted to emulate the ActiveRecord facade style interaction, 
  # allowing for Execution.execute(Functionality, Hash) invocation.
  def self.execute(functionality:, arguments:)
    execution = Execution.new \
      functionality: functionality, arguments: arguments

    execution.execute_function
  end

  private

  def initialize(functionality:, arguments:)
    @arguments = arguments
    @functionality = functionality

    build_dependencies
  end

  def build_dependencies
    @arguments.each do |argument, value|
      instance_variable_set("@#{argument}", value) \
        unless instance_variable_defined?("@#{argument}")
    end
  end

  def execute_function
    @result = eval @functionality.function_definition, binding
  end
end