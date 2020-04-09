FactoryBot.define do
  factory :status do
    user { create(:user) }
    text { Faker::Beer.name }
  end
end
