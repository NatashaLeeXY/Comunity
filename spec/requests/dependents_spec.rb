require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/dependents", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Dependent. As you add validations to Dependent, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Dependent.create! valid_attributes
      get dependents_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      dependent = Dependent.create! valid_attributes
      get dependent_url(dependent)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_dependent_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      dependent = Dependent.create! valid_attributes
      get edit_dependent_url(dependent)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Dependent" do
        expect {
          post dependents_url, params: { dependent: valid_attributes }
        }.to change(Dependent, :count).by(1)
      end

      it "redirects to the created dependent" do
        post dependents_url, params: { dependent: valid_attributes }
        expect(response).to redirect_to(dependent_url(Dependent.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Dependent" do
        expect {
          post dependents_url, params: { dependent: invalid_attributes }
        }.to change(Dependent, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post dependents_url, params: { dependent: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested dependent" do
        dependent = Dependent.create! valid_attributes
        patch dependent_url(dependent), params: { dependent: new_attributes }
        dependent.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the dependent" do
        dependent = Dependent.create! valid_attributes
        patch dependent_url(dependent), params: { dependent: new_attributes }
        dependent.reload
        expect(response).to redirect_to(dependent_url(dependent))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        dependent = Dependent.create! valid_attributes
        patch dependent_url(dependent), params: { dependent: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested dependent" do
      dependent = Dependent.create! valid_attributes
      expect {
        delete dependent_url(dependent)
      }.to change(Dependent, :count).by(-1)
    end

    it "redirects to the dependents list" do
      dependent = Dependent.create! valid_attributes
      delete dependent_url(dependent)
      expect(response).to redirect_to(dependents_url)
    end
  end
end
