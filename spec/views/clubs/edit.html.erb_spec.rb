require 'rails_helper'

RSpec.describe "clubs/edit", type: :view do
  before(:each) do
    @club = assign(:club, Club.create!(
      name: "MyText",
      federation: nil
    ))
  end

  xit "renders the edit club form" do
    render

    assert_select "form[action=?][method=?]", club_path(@club), "post" do

      assert_select "textarea[name=?]", "club[name]"

      assert_select "input[name=?]", "club[federation_id]"
    end
  end
end
