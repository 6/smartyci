FactoryGirl.define do
  factory :project do
    project_owner

    sequence(:remote_id) { |n| "project-#{n}" }
    sequence(:name) { |n| "Project#{n}" }
  end
end
