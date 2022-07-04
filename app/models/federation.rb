class Federation < ApplicationRecord
  has_many :clubs

  validates :name, presence: true
  validates :foundation_date, presence: true
end
