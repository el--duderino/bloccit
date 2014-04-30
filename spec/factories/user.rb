FactoryGirl.define do
  factory :user do
    name "Douglas Adams"
    email "douglas@adams.com"
    password "helloworld"
    password_confirmation "helloworld"
    confirmed_at Time.now
  end
end