require 'rails_helper'

RSpec.describe Federation, type: :model do
  describe 'validations' do
    it 'validate presence of required fields' do
      should validate_presence_of(:name)
      should validate_presence_of(:foundation_date)
    end

    it 'validate relations' do
      should have_many(:clubs)
    end
  end
end
