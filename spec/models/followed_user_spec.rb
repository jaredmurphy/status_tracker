require 'rails_helper'

RSpec.describe FollowedUser, type: :model do
  describe "#follower" do
    context "when the follower is not present" do
      subject(:relationship) { build(:followed_user, follower: nil ) }

      it { is_expected.to be_invalid }
    end
  end

  describe "#following" do
    context "when the following is not present" do
      subject(:relationship) { build(:followed_user, following: nil ) }

      it { is_expected.to be_invalid }
    end
  end

  describe "#status" do
    context "when the status is not present" do
      subject(:relationship) { build(:followed_user, status: nil ) }

      it { is_expected.to be_invalid }
    end

    %i[pending accepted blocked].each do |status|
      context "when the status is #{status}" do
        subject(:relationship) { build(:followed_user, status ) }

        it "responds to ##{status}?" do
          expect(subject.send("#{status}?")).to be true
        end

        it "is incldued in the .#{status} scope" do
          followed = create(:followed_user, status: status)
          expect(described_class.send(status)).to include(followed)
        end
      end
    end
  end
end
