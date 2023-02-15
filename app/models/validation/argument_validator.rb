# frozen_string_literal: true

module Validations

  OBJECT = {
    name: "object",
    types: [
      Hash,
    ]
  }.freeze

  NUMBER = {
    name: 'number',
    types: [
      Integer,
      Float
    ]
  }.freeze

  STRING = {
    name: 'string',
    types: [
      String
    ]
  }.freeze

  ARRAY = {
    name: 'array',
    types: [
      Array
    ]
  }.freeze

  class ArgumentValidator

    attr_reader :errors

    # ArgumentValidator is usually given the `Function#variable_object` and the request JSON body
    # and validates the body against the functionality definition of required arguments.
    def initialize(expected, given)
      @expected = expected
      @given = given
    end

    def valid?
      raise ArgumentError, 'Unexpected number of variables provided.' \
        unless @expected.keys.length == @given.keys.length

      # TODO: Per-argument demarkation of validation error.

      @given.each do |variable, value|
        raise ArgumentError, "Variable '#{variable}' did not match expected type." \
          unless variable_valid? variable, value
      end

      true
    end

<<<<<<< Updated upstream
    def variable_valid?(given_variable, given_value)
      # This selects from 
      validation = Validations.const_get @expected[given_variable].upcase
=======
    def variable_valid?(variable, value)
      validation = Validations.const_get @expected[variable].upcase
>>>>>>> Stashed changes

      true if validation[:types].include? value.class
    end

  end
end
