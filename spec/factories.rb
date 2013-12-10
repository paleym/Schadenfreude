FactoryGirl.create :user do |user|
  user.name                   "Mark Brown"
  user.email                 "mbrown@yahoo.com"
  user.password               "foobar"
  user.password_confirmation  "foobar"
end