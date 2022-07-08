FactoryBot.define do
  factory :reservation do
    token                 {"tok_abcdefghijk00000000000000000"}
    price                 {13000}
    children_number_id    {2}
    children_name         {"kai"}
    age_id                {2}
    nationality           {"japan"}
    phone_number          {"08084849944"}
    association :user
  end
end
