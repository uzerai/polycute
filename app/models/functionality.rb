class Functionality < ApplicationRecord
  validates :name, presence: true
  validates :route, presence: true
  validates :variable_object, presence: true
  validates :function_definition, presence: true
  validates :registration_payload, presence: true
end
