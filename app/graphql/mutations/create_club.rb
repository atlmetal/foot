module Mutations
  class CreateClub < BaseMutation
    argument :id, ID, required: true
    argument :name, String, required: true
    argument :foundation_date, GraphQL::Types::ISO8601Date, required: true
    argument :federation_id, GraphQL::Types::ISO8601Date, required: true

    field :success, Boolean, null: false
    field :errors, [String], null: false
    field :book, Types::ClubType, null: true
  end
end
