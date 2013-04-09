# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    full_name "John Doe"
    sequence(:email) {|n| "john#{n}@example.org" }
    password "abc123!"
  end
end
