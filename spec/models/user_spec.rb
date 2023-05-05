require "rails_helper"

RSpec.describe User do
  let(:user_a) { create(:user, email: "teste@gmail.com") }
  let(:user_b) { build(:user, email: "example_example") }
  let(:user_c) { build(:user, email: "teste@gmail.com") }

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password_digest) }
    it { is_expected.to validate_presence_of(:email) }

    describe "email" do
      context "when email is valid" do
        let(:errors_details) do
          []
        end

        before do
          user_a.valid?
        end

        it do
          expect(user_a.errors.details[:email]).to(
            eq(errors_details)
          )
        end
      end

      context "when email is incorrect" do
        let(:errors_details) do
          [
            {
              error: :invalid,
              value: "example_example"
            }
          ]
        end

        before do
          user_b.valid?
        end

        it do
          expect(user_b.errors.details[:email]).to(
            eq(errors_details)
          )
        end
      end

      context "when email is not unique" do
        let(:errors_details) do
          [{
            error: :taken,
            value: "teste@gmail.com"
          }]
        end

        before do
          user_a
          user_c.valid?
        end

        it do
          expect(user_c.errors.details[:email]).to(
            eq(errors_details)
          )
        end
      end
    end
  end

  # describe "Enumerize" do
  #   context "with kind" do
  #     it "has associate, coach, and financial kinds" do
  #       expect(User::KINDS).to eq(%i[associate coach financial])
  #     end
  #   end
  # end
end
