require 'rails_helper'

RSpec.describe Services::Stats::Create do
  let(:service) { described_class.new }

  subject { service.call }

  context 'creates stats' do
    it 'returns stats' do
      subject
    end
  end
end
