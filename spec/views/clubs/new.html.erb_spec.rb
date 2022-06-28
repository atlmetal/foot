require 'rails_helper'

RSpec.describe "clubs/new", type: :view do
  before(:each) do
    assign(:club, Club.new(
      name: "MyText",
      federation: nil
    ))
  end

  it "renders new club form" do
    render

    assert_select "form[action=?][method=?]", clubs_path, "post" do

      assert_select "textarea[name=?]", "club[name]"

      assert_select "input[name=?]", "club[federation_id]"
    end
  end
end
