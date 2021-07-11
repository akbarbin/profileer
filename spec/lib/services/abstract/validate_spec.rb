require 'rails_helper'

RSpec.describe Services::Abstract::Phones::Validate do
  let(:service) { described_class.new(number) }
  let(:number)  { 14152007986 }

  subject { service.call }

  context 'phone exists' do
    it 'should not create a phone' do
      phone = Phone.create! number: number
      expect { subject }.not_to change(Phone, :count)
    end
  end

  context 'phone does not exists' do
    it "should create a new phone", :vcr  do
      expect { subject }.to change(Phone, :count).by(1)
    end
  end

  context '#send_request' do
    subject { service.send(:send_request) }

    it "returns phone response", :vcr do
      expect(subject).to have_key(:phone)
      expect(subject).to have_key(:valid)
      expect(subject).to have_key(:format)
      expect(subject).to have_key(:country)
      expect(subject).to have_key(:location)
    end
  end
end
