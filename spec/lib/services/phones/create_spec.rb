require 'rails_helper'

RSpec.describe Services::Phones::Create do
  let(:service) { described_class.new(params) }
  let(:params) { { number: 62998989898 } }

  subject { service.call }

  it "creates a new Phone" do
    expect { subject }.to change(Phone, :count).by(1)
  end

  context 'finds existing Phone' do
    it 'returns phone' do
      phone = Phone.create! params
      expect { subject }.not_to change(Phone, :count)
    end
  end
end
