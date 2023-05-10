FactoryBot.define do
  factory :payment do
    paid { "pago com atraso" }

    association :customer
  end
end
