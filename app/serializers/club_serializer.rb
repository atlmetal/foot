class ClubSerializer < ActiveModel::Serializer
  attributes :id, :name, :foundation_date
  has_many :players
  belongs_to :federation
end
