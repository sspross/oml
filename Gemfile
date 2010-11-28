source 'http://rubygems.org'

gem 'rails', '3.0.0'

# gem 'authlogic', '>=2.1.6'
gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'
# gem 'formtastic-rails3'
# gem 'formtastic', :git => "http://github.com/justinfrench/formtastic.git", :branch => "rails3"
gem 'formtastic', '1.1.0.beta'
gem 'haml', '3.0.18'
gem "exception_notification", :git => "http://github.com/rails/exception_notification.git", :require => 'exception_notifier'
gem 'globalize3'


# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'yard'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'capistrano'
  gem 'capistrano-ext'
  gem 'ruby-debug'
  gem 'ZenTest'
  gem 'autotest-rails'
  gem 'redgreen'
  gem 'autotest-growl'
end

# Lokal:
# bundle install --without production
group :production do
  gem 'mysql'
end
