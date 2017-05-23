class ProjectOwner < ApplicationRecord
  has_many :projects

  VCS_TYPES = %w[github].freeze

  validates :remote_id, uniqueness: true
  validates :name, presence: true
  validates :vcs_type, inclusion: {in: VCS_TYPES}
end
