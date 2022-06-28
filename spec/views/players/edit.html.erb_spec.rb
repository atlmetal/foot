require 'rails_helper'

RSpec.describe "players/edit", type: :view do
  before(:each) do
    @player = assign(:player, Player.create!(
      name: "MyText",
      value: 1,
      club: nil
    ))
  end

  it "renders the edit player form" do
    render

    assert_select "form[action=?][method=?]", player_path(@player), "post" do

      assert_select "textarea[name=?]", "player[name]"

      assert_select "input[name=?]", "player[value]"

      assert_select "input[name=?]", "player[club_id]"
    end
  end
end
