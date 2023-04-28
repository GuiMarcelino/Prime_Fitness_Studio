FactoryBot.define do
  factory :customer do
    email { FFaker::Internet.email }
    name { FFaker::NameBR.name }
    active { true }
    phone_number { FFaker::PhoneNumber.phone_number }
    gender { :other }
  end
end
