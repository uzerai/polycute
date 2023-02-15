# frozen_string_literal: true

class Functionality < ApplicationRecord
  RESTRICTED_NAMES = [
    'REGISTER', # Registers the requester as a polycute node in a target node. ie A -> REGISTER -> B, B now knows about A, and A knows if B is public/private. Should instigate a B -> REGISTER -> A. 
    'NOTIFY', # Receives a notification about missing functionality, usually from a flood. This notification will flood its largest node.
    'REQUIRE', # Requests the service to add a gem then restart.
    'FLOOD' # Functionality to notify every registered private node to see if they have functionality public or private with the given name.
  ].freeze

  self.primary_key = 'uuid'

  validates :uuid, presence: true

  validates :name, presence: true
  validates :route, presence: true
  validates :variable_object, presence: true
  validates :function_definition, presence: true
  validates :registration_payload, presence: true

  # Overriden here to exclude fields from json serialization.
  def as_json(options={})
    options[:except] ||= [
      :registration_payload,
      :uuid,
      :created_at, 
      :updated_at
    ]
    super(options)
  end
end
