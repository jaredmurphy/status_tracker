require 'rails_helper'

RSpec.describe Status, type: :model do
  describe "validations" do
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
  end
end
