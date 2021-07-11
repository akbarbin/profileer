require 'rails_helper'

RSpec.describe Phone, type: :model do
  it { should validate_presence_of(:number) }
  it { should validate_numericality_of (:number) }
end
