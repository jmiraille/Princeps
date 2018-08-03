FactoryBot.define do
  factory :question do
    sequence(:content) { |n| "Quesion_#{n} ?"}
  end
end
