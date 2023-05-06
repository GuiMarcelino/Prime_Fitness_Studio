require "rails_helper"

RSpec.describe Activity do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:shift) }
  end
end
