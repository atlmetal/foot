require 'rails_helper'

RSpec.describe "federations/new", type: :view do
  before(:each) do
    assign(:federation, Federation.new(
      name: "MyText"
    ))
  end

  it "renders new federation form" do
    render

    assert_select "form[action=?][method=?]", federations_path, "post" do

      assert_select "textarea[name=?]", "federation[name]"
    end
  end
end
