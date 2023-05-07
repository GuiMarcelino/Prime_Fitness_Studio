FactoryBot.define do
  factory :activity do
    name { FFaker::NameBR.name }
    shift { "Morning" }
  end
end
