#frozen_string_literal: true

class Functionality < ApplicationRecord
  self.primary_key = 'uuid'

  validates :uuid, presence: true

  validates :name, presence: true
  validates :route, presence: true
  validates :variable_object, presence: true
  validates :function_definition, presence: true
  validates :registration_payload, presence: true
end
