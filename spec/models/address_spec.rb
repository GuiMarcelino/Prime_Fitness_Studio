require "rails_helper"

RSpec.describe Address do
  describe "validations" do
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:neighborhood) }
    it { is_expected.to validate_presence_of(:number) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:state) }
  end
end
