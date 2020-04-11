require 'rails_helper'

RSpec.describe Status, type: :model do
  describe "#text" do
    context "when the text is not present" do
      subject(:status) { build(:status, text: "" ) }

      it { is_expected.to be_invalid }
    end
  end

  describe "#user" do
    context "when the user is not present" do
      subject(:status) { build(:status, user: nil) }

      it { is_expected.to be_invalid }
    end
  end

  describe "#do_not_disturb" do
    subject(:status) { create(:status) }

    it "is false by default" do
      expect(status.do_not_disturb).to be false
    end
  end

  describe ".current" do
    subject(:current_status) { described_class.current(user) }

    let(:user) { create(:user) }
    let!(:first_status) { create(:status, user: user) }
    let!(:last_status) { create(:status, user: user) }

    it "returns the user's current status" do
      expect(current_status).to eq(last_status)
    end
  end
end
