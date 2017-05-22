class Build < ApplicationRecord
  belongs_to :project

  validates :project, presence: true
  validates :branch, presence: true
  validates :commit, presence: true
  validates :remote_trigger_id, uniqueness: true, if: :remote_trigger_id
end
