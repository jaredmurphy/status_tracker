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

    describe "friendships" do
      let(:user) { create(:user) }
      let(:associated) { create(:user) }

      shared_examples_for :followed_user_relationship do
        context "when the relationship is pending" do
          let(:status) { :pending }

          it "does not include the user" do
            expect(subject).to_not include(associated)
          end
        end

        context "when the relationship is accepted" do
          let(:status) { :accepted }

          it "includes the user" do
            expect(subject).to include(associated)
          end
        end

        context "when the relationship is blocked" do
          let(:status) { :blocked }

          it "does not include the user" do
            expect(subject).to_not include(associated)
          end
        end
      end

      describe "#followers" do
        subject(:followers) { user.followers }

        before { create(:followed_user, following: user, follower: associated, status: status) }

        it_behaves_like :followed_user_relationship
      end

      describe "#following" do
        subject(:following) { user.following }

        before { create(:followed_user, following: associated, follower: user, status: status) }

        it_behaves_like :followed_user_relationship
      end
    end
  end
end
