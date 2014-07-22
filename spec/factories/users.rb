FactoryGirl.define do
  factory :user do
    email      						"some@one.com"
    password   						"monkey"
    password_confirmation "monkey"
  end
end