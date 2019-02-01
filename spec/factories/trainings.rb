FactoryBot.define do
  factory :training do
    date { Date.today }
    user
  end
end
