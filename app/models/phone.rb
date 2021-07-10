class Phone < ApplicationRecord
  validates :number, presence: true
end
