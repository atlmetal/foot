require 'rails_helper'

RSpec.describe Club, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_presence_of(:foundation_date)
      should validate_presence_of(:federation_id)
    end

    it 'validate relations' do
      should have_many(:players)
    end
  end
end
