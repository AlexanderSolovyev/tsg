FactoryGirl.define do
  factory :new  do
    title 'MyTitle'
    description 'MyDescription'
  end
  factory :user do
    email 'admin@email.com'
    password 'password'
    password_confirmation 'password'
    confirmed_at Time.now
  end
end
