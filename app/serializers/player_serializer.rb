class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :name, :birth_date, :value
end
