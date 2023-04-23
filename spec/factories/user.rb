FactoryBot.define do
    factory :user do
      email { FFaker::Internet.email }
      name { FFaker::NameBR.name }
      password { "Grur0938@@$" }
      password_confirmation { "Grur0938@@$" }
      kind { :associate }
  end
end
