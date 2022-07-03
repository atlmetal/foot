require 'rails_helper'

RSpec.describe "players/index", type: :view do
  before(:each) do
    assign(:players, [
      Player.create!(
        name: "MyText",
        value: 2,
        club: nil
      ),
      Player.create!(
        name: "MyText",
        value: 2,
        club: nil
      )
    ])
  end

  xit "renders a list of players" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
