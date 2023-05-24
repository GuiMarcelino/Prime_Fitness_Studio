require "rails_helper"

RSpec.describe Activity do
  describe "associations" do
    it { is_expected.to have_many(:user_activities) }
    it { is_expected.to have_many(:users) }
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:shift) }
  end
end
