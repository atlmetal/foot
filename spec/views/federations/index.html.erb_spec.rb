require 'rails_helper'

RSpec.describe "federations/index", type: :view do
  before(:each) do
    assign(:federations, [
      Federation.create!(
        name: "MyText"
      ),
      Federation.create!(
        name: "MyText"
      )
    ])
  end

  it "renders a list of federations" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
  end
end
