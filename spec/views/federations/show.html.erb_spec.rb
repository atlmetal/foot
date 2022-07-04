require 'rails_helper'

RSpec.describe "federations/show", type: :view do
  before(:each) do
    @federation = assign(:federation, Federation.create!(
      name: "MyText"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
