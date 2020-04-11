FactoryBot.define do
  factory :followed_user do
    follower { create(:user) }
    following { create(:user) }
    status { :pending }

    trait :pending do
      status { :pending }
    end

    trait :accepted do
      status { :accepted }
    end

    trait :blocked do
      status { :blocked }
    end
  end
end
