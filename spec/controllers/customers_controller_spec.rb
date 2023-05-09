require "rails_helper"

RSpec.describe CustomersController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:customer) { create(:customer) }

    it "returns a successful response" do
      get :show, params: { id: customer.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:valid_params) do
      { customer: {
        name: "John Doe",
        email: "john@example.com",
        phone_number: "123456789",
        gender: "Male", active: true
      } }
    end
    let(:invalid_params) do
      { customer: {
        name: "",
        email: "jjones",
        phone_number: "123456789",
        gender: "Male", active: true
      } }
    end

    xit "creates a new customer" do
      expect do
        post :create, params: valid_params
      end.to change(Customer, :count).by(1)
    end

    xit "returns a successful response" do
      post :create, params: valid_params
      expect(response).to have_http_status(:created)
    end

    context "with invalid params" do
      it "does not create a new customer" do
        expect do
          post :create, params: invalid_params
        end.not_to change(Customer, :count)
      end

      it "returns an unprocessable entity status" do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    let(:customer) { create(:customer) }
    let(:valid_params) do
      { id: customer.id, customer: { name: "Updated Customer" } }
    end
    let(:invalid_params) { { id: customer.id, customer: { name: "" } } }

    context "with valid params" do
      it "updates the customer" do
        patch :update, params: valid_params
        customer.reload
        expect(customer.name).to eq("Updated Customer")
      end

      it "returns a successful response" do
        patch :update, params: valid_params
        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid params" do
      it "does not update the customer" do
        patch :update, params: invalid_params
        customer.reload
        expect(customer.name).not_to eq("")
      end

      it "returns an unprocessable entity status" do
        patch :update, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:customer) { create(:customer) }

    it "destroys the customer" do
      expect do
        delete :destroy, params: { id: customer.id }
      end.to change(Customer, :count).by(-1)
    end

    it "returns a successful response" do
      delete :destroy, params: { id: customer.id }
      expect(response).to have_http_status(:success)
    end
  end
end
