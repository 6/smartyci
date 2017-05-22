FactoryGirl.define do
  factory :github_project do
    github_project_owner

    sequence(:remote_id) { |n| "github-project-#{n}" }
    sequence(:name) { |n| "Project#{n}" }
  end
end
