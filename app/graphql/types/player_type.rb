# frozen_string_literal: true

module Types
  class PlayerType < Types::BaseObject
    field :id, ID, null: false
    field :name, String
    field :birth_date, GraphQL::Types::ISO8601Date
    field :value, Integer
    field :club_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
