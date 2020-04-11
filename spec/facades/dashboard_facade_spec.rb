require "rails_helper"

RSpec.describe DashboardFacade do
  subject(:dashboard) { described_class.new(user) }

  let(:user) { create(:user) }

  describe "#username" do
    subject(:username) { dashboard.username }

    it "presents the user's username" do
      expect(username).to eq(user.username)
    end
  end

  describe "#current_statuses" do
    subject(:current_statuses) { dashboard.current_statuses }

    let(:expected_statuses) { user.following.map { |user| Status.current(user) } }

    before do
      create_list(:followed_user, 2, :accepted, follower: user)

      2.times do
        user.following.each do |friend|
          create(:status, user: friend )
        end
      end
    end

    it "shows the current status from the user's following list" do
      expect(current_statuses).to eq expected_statuses
    end
  end
end
