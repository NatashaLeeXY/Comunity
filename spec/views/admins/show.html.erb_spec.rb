require 'rails_helper'

RSpec.describe "administrator/admins/show", type: :view do
  before(:each) do
    assign(:admin, Admin.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
