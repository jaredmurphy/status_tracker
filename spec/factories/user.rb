FactoryBot.define do
  factory :user do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    trait :with_accepted_follower do
      after :create do |user|
        create(:followed_user, :accepted, following: user)
      end
    end
  end
end
