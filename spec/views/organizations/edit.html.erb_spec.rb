require 'rails_helper'

RSpec.describe "organizations/edit", type: :view do
  let(:organization) {
    Organization.create!()
  }

  before(:each) do
    assign(:organization, organization)
  end

  it "renders the edit organization form" do
    render

    assert_select "form[action=?][method=?]", organization_path(organization), "post" do
    end
  end
end
