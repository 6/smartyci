FactoryGirl.define do
  factory :github_project_owner do
    sequence(:remote_id) { |n| "github-owner-#{n}" }
    sequence(:name) { |n| "Owner#{n}" }
  end
end
