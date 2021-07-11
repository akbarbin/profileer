class Phone < ApplicationRecord
  validates :number, numericality: { only_integer: true }, presence: true
end
