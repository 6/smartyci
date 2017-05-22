FactoryGirl.define do
  factory :build do
    project { build(:github_project) }

    sequence(:branch) { |n| "branch-#{n}" }
    sequence(:commit) { |n| "commit-hash-#{n}" }

    trait :started do
      started_at { 1.minute.ago }
    end

    trait :completed do
      started
      completed_at { Time.now }
    end

    trait :failed do
      started
      failed { Time.now }
    end
  end
end
