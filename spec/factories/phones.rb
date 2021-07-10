FactoryBot.define do
  factory :phone do
    number { 628561111111 }
    status { false }
    location { 'Indonesia' }
    type { 'mobile' }
    carrier { 'im3 Ooredoo' }
  end
end
