require "rails_helper"

RSpec.describe UserActivity do
  describe "associations" do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to belong_to(:activity) }
  end
end
