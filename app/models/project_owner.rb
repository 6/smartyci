class ProjectOwner < ApplicationRecord
  has_many :projects

  validates :remote_id, uniqueness: true
  validates :name, presence: true
end
