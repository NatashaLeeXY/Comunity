require 'rails_helper'

RSpec.describe "organizations/show", type: :view do
  before(:each) do
    assign(:organization, Organization.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
