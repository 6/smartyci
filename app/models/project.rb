class Project < ApplicationRecord
  belongs_to :project_owner
  has_many :builds

  validates :project_owner, presence: true
  validates :remote_id, presence: true, uniqueness: {scope: [:type]}
end
