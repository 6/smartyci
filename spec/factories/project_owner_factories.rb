FactoryGirl.define do
  factory :project_owner do
    sequence(:remote_id) { |n| "owner-#{n}" }
    sequence(:name) { |n| "Owner#{n}" }
    vcs_type "github"
  end
end
