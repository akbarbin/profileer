require 'rails_helper'
require 'bcrypt'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:email) }
end
