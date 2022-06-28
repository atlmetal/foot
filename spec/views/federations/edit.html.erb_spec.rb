require 'rails_helper'

RSpec.describe "federations/edit", type: :view do
  before(:each) do
    @federation = assign(:federation, Federation.create!(
      name: "MyText"
    ))
  end

  it "renders the edit federation form" do
    render

    assert_select "form[action=?][method=?]", federation_path(@federation), "post" do

      assert_select "textarea[name=?]", "federation[name]"
    end
  end
end
