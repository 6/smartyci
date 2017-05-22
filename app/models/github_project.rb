class GithubProject < Project
  belongs_to :github_project_owner, foreign_key: :project_owner_id
end
