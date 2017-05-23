class Project < ApplicationRecord
  belongs_to :project_owner
  has_many :builds

  validates :project_owner, presence: true

  # TODO: should also include vcs_type in uniquness check
  # http://www.seanbehan.com/validate-uniqueness-on-join-tables-in-rails/
  validates :remote_id, presence: true, uniqueness: true

  delegate :vcs_type, to: :project_owner

  def vcs_uri
    # TODO: handle private repos and non-Github URLs
    "https://github.com/#{project_owner.name}/#{name}.git"
  end
end
