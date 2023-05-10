require "rails_helper"

RSpec.describe Customer do
  describe "associations" do
    it { is_expected.to have_many(:payments) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:gender) }
    it { is_expected.to validate_presence_of(:phone_number) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:active) }
  end

  describe "Enumerize" do
    context "with gender" do
      it "has female, male, and other gender" do
        expect(Customer::GENDER).to eq(%i[female male other])
      end
    end
  end
end
