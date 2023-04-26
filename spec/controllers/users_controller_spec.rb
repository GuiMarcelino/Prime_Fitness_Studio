require "rails_helper"

RSpec.describe UsersController, type: :controller do
  describe "GET #index" do
    context "when authenticated" do
      let(:user_a) { create(:user, email: "teste@gmail.com") }

      it "returns a JSON response with all users" do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context "when not authenticated" do
      it "returns an unauthorized response" do
        get :index
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
