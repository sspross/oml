# factory_girl configuration
#
# It is highly recommended that you have one factory for each class that
# provides the simplest set of attributes necessary to create an instance of
# that class. If you’re creating ActiveRecord objects, that means that you
# should only provide attributes that are required through validations and that
# do not have defaults. Other factories can be created through inheritance to
# cover common scenarios for each class.


Factory.define :user do |f|
  f.email { Factory.next(:email) }
  f.password "welcome"
  f.password_confirmation "welcome"
end

Factory.sequence :email do |n|
  "user#{n}@example.com"
end

Factory.define :movie do |f|
  f.title { Factory.next(:title) }
end

Factory.sequence :title do |n|
  "movietitle#{n}"
end

Factory.define :friendship do |f, user, friend|
  f.user user
  f.friend friend
  f.approved false
end

Factory.define :rating do |f, movie, user, value|
  f.movie movie
  f.user user
  f.value value
end