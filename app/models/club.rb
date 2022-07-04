class Club < ApplicationRecord
  belongs_to :federation
  has_many :players

  validates :name, presence: true
  validates :foundation_date, presence: true
  validates :federation_id, presence: true
end
