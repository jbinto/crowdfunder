# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    title "Wifi enabled shoes"
    teaser "Now you too can run at 5Ghz!"
    description "A mostly useless project, please give us your money!"
    goal 25000
  end
end
