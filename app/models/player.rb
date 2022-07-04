class Player < ApplicationRecord
  belongs_to :club

  validates :name, presence:true
  validates :birth_date, presence:true
  validates :value, presence:true
  validates :club_id, presence:true
end
