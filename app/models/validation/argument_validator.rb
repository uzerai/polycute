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

  class ArgumentValidator

    attr_reader :errors

    # ArgumentValidator is usually given the `Function#variable_object` and the request JSON body
    # and validates the body against the functionality definition of required arguments.
    def initialize(expected, given)
      @expected = expected
      @given = given
    end

    def valid?
      raise ArgumentError, 'Number of variables unexpected.' \
        unless @expected.keys.length == @given.keys.length

      # TODO: Per-argument demarkation of validation error.

      @given.each do |variable, value|
        raise ArgumentError, "Variable '#{variable}' did not match expected type." \
          unless variable_valid? variable, value
      end

      true
    end

    def variable_valid?(given_variable, given_value)
      # This selects from 
      validation = Validations.const_get @expected[given_variable].upcase

      true if validation[:types].include? given_value.class
    end

  end
end
