require "rails_helper"

RSpec.describe ActivitiesController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:activity) { create(:activity) }

    it "returns a successful response" do
      get :show, params: { id: activity.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    let(:valid_params) do
      { activity: { name: "Test Activity", shift: "Morning" } }
    end
    let(:invalid_params) { { activity: { name: "", shift: "Afternoon" } } }

    context "with valid params" do
      it "creates a new activity" do
        expect do
          post :create, params: valid_params
        end.to change(Activity, :count).by(1)
      end

      it "returns a successful response" do
        post :create, params: valid_params
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid params" do
      it "does not create a new activity" do
        expect do
          post :create, params: invalid_params
        end.not_to change(Activity, :count)
      end

      it "returns an unprocessable entity status" do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH #update" do
    let(:activity) { create(:activity) }
    let(:valid_params) do
      { id: activity.id, activity: { name: "Updated Activity" } }
    end
    let(:invalid_params) { { id: activity.id, activity: { name: "" } } }

    context "with valid params" do
      it "updates the activity" do
        patch :update, params: valid_params
        activity.reload
        expect(activity.name).to eq("Updated Activity")
      end

      it "returns a successful response" do
        patch :update, params: valid_params
        expect(response).to have_http_status(:success)
      end
    end

    context "with invalid params" do
      it "does not update the activity" do
        patch :update, params: invalid_params
        activity.reload
        expect(activity.name).not_to eq("")
      end

      it "returns an unprocessable entity status" do
        patch :update, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:activity) { create(:activity) }

    it "destroys the activity" do
      expect do
        delete :destroy, params: { id: activity.id }
      end.to change(Activity, :count).by(-1)
    end

    it "returns a successful response" do
      delete :destroy, params: { id: activity.id }
      expect(response).to have_http_status(:success)
    end
  end
end
