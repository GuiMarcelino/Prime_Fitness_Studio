require "rails_helper"

RSpec.describe PaymentsController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:payment) { create(:payment) }

    it "returns a successful response" do
      get :show, params: { id: payment.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:customer) { create(:customer) }

    let(:valid_params) do
      { payment: { paid: "Pago", customer_id: customer.id } }
    end

    let(:invalid_params) { { payment: { paid: nil, customer_id: nil } } }

    context "with valid params" do
      it "creates a new payment" do
        expect do
          post :create, params: valid_params
        end.to change(Payment, :count).by(1)
      end
    end

    context "with invalid params" do
      it "does not create a new payment" do
        expect do
          post :create, params: invalid_params
        end.not_to change(Payment, :count)
      end
    end
  end

  describe "PATCH #update" do
    let(:payment) { create(:payment) }
    let(:valid_params) do
      { id: payment.id, payment: { paid: false } }
    end
    let(:invalid_params) { { id: payment.id, payment: { paid: nil } } }

    context "with valid params" do
      it "updates the payment" do
        patch :update, params: valid_params
        payment.reload
        expect(payment.paid).to eq("false")
      end
    end

    context "with invalid params" do
      it "does not update the payment" do
        patch :update, params: invalid_params
        payment.reload
        expect(payment.paid).not_to eq(nil)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:payment) { create(:payment) }

    it "destroys the payment" do
      expect do
        delete :destroy, params: { id: payment.id }
      end.to change(Payment, :count).by(-1)
    end

    it "returns a successful response" do
      delete :destroy, params: { id: payment.id }
      expect(response).to have_http_status(:success)
    end
  end
end
