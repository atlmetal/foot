require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_presence_of(:birth_date)
      should validate_presence_of(:value)
      should validate_presence_of(:club_id)
    end
  end
end
