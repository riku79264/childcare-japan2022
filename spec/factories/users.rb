FactoryBot.define do
  factory :user do
    name                    {'test'}
    email                   {'test@tt'}
    password                {'test00'}
    password_confirmation   {'test00'}
  end
end
