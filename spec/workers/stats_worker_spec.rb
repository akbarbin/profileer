require 'rails_helper'
RSpec.describe StatsWorker, type: :worker do
  it { is_expected.to be_processed_in :default }
end
