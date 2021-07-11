class StatsWorker
  include Sidekiq::Worker

  def perform
    Services::Stats::Refresh.new.call
  end
end
