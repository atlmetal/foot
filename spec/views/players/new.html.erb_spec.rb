require 'rails_helper'

RSpec.describe "players/new", type: :view do
  before(:each) do
    assign(:player, Player.new(
      name: "MyText",
      value: 1,
      club: nil
    ))
  end

  it "renders new player form" do
    render

    assert_select "form[action=?][method=?]", players_path, "post" do

      assert_select "textarea[name=?]", "player[name]"

      assert_select "input[name=?]", "player[value]"

      assert_select "input[name=?]", "player[club_id]"
    end
  end
end
