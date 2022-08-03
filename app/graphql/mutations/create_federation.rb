module Mutations
  class CreateFederation < BaseMutation
    # argument :id, ID, required: true
    argument :name, String, required: true
    argument :foundation_date, GraphQL::Types::ISO8601Date, required: false

    # field :success, Boolean, null: false
    # field :errors, [String], null: false
    # field :book, Types::FederationType, null: true

    type Types::FederationType

    def resolve(name:, foundation_date:)
      Federation.create!(name: name, foundation_date: foundation_date)
    end
  end
end
