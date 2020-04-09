require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    describe "#username" do
      context "when the username is not present" do
        subject(:user) { build(:user, username: "" ) }

        it { is_expected.to be_invalid }
      end
    end

    describe "#email" do
      context "when the email is not present" do
        subject(:user) { build(:user, email: "" ) }

        it { is_expected.to be_invalid }
      end

      context "when the email is not valid" do
        subject(:user) { build(:user, email: "not a valid email" ) }

        it { is_expected.to be_invalid }
      end

      context "when the email is not unique" do
        let(:valid_user) { create(:user) }

        subject(:invalid_user) { build(:user, email: valid_user.email) }

        it { is_expected.to be_invalid }
      end
    end

    describe "#password" do
      context "when the password is not present" do
        subject(:user) { build(:user, password: "" ) }

        it { is_expected.to be_invalid }
      end

      context "when the password is not valid" do
        subject(:user) { build(:user, password: "!vld" ) }

        it { is_expected.to be_invalid }
      end
    end
  end
end
