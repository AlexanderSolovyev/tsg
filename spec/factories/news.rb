FactoryGirl.define do
  factory :new  do
    title 'MyTitle'
    description 'MyDescription'
  end
  factory :user do
    email 'admin@email.com'
    password 'password'
    password_confirmation 'password'
    admin true
    confirmed_at Time.now
  end
  factory :invalid_new, class: 'New' do
    title ''
    description ''
  end

end
