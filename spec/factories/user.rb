FactoryBot.define do
    factory :user do
      email { FFaker::Internet.email }
      name { FFaker::NameBR.name }
      password_digest { "Grur0938@@$" }
      username { FFaker::NameBR.name }
  end
end
