class Build < ApplicationRecord
  belongs_to :project

  validates :project, presence: true
  validates :branch, presence: true
  validates :commit, presence: true
  validates :remote_trigger_id, uniqueness: true, if: :remote_trigger_id

  delegate :vcs_uri, to: :project

  def started?
    started_at.present?
  end

  def completed?
    completed_at.present?
  end

  def failed?
    failed_at.present?
  end

  def run!
    return false if started?
    update!(started_at: Time.now)
    clone_and_checkout!
    analyze!
    true
  rescue => e
    update!(failed_at: Time.now)
    logger.error e.message
    logger.error e.backtrace.join("\n")
    Rollbar.error(e, {build_id: id})
    false
  ensure
    FileUtils.remove_dir(clone_directory) if Dir.exist?(clone_directory)
  end

  def reset!
    @clone_directory = nil
    update!(started_at: nil, completed_at: nil, failed_at: nil)
  end

  def clone_directory
    @clone_directory ||= Dir.mktmpdir
  end

  private

  def clone_and_checkout!
    logger.info "clone_and_checkout!: #{commit}, #{clone_directory}"
    Dir.chdir(clone_directory) do
      `git clone -n #{vcs_uri} --depth 50 .`
      # TODO: code assumes that default (current) branch is master
      if branch == "master"
        `git checkout #{commit}`
      else
        `git checkout -b #{branch} #{commit}`
      end
    end
  end

  def analyze!
    rubocop_config_path = "#{`pwd`.strip}/.rubocop.yml"
    logger.info "analyze!: #{rubocop_config_path}"
    Dir.chdir(clone_directory) do
      result = JSON.parse(`rubocop -c #{rubocop_config_path} -f json`)
      self.results = {
        rubocop: result,
      }
      save!
    end
  end
end
