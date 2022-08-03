module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :federations, [Types::FederationType], null: false, description: 'Federations'

    field :clubs, [Types::ClubType], null: false, description: 'All clubs'

    field :players, [Types::PlayerType], null: false, description: "Return a list of players"

    def federations
      Federation.all
    end

    def clubs
      Club.all
    end

    def players
      Player.all
    end
  end
end
