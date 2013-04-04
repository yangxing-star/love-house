source 'http://rubygems.org'
source 'http://gems.taodinet.com:8808'

gem 'rails', '3.2.13'
gem 'rake'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

# gem 'rb-readline'
gem 'nokogiri'
gem 'mechanize'
gem 'daemons'
gem 'mysql2'
gem 'json'
gem 'dalli'
gem 'memcached'
gem 'msgpack'
gem 'msgpack-rpc'

gem 'kaminari',                  :git => 'git://github.com/amatsuda/kaminari'
gem 'simple_captcha',            :git => 'git://github.com/galetahub/simple-captcha.git'
gem 'simple_column_search',      :git => 'git://github.com/jacktang/simple_column_search.git'
gem 'delayed_job',               :git => 'git://github.com/collectiveidea/delayed_job.git'
gem 'delayed_job_active_record', :git => 'git://github.com/collectiveidea/delayed_job_active_record.git'
# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'execjs'
  
  gem 'uglifier', '>= 1.0.3'
end

gem 'turbo-sprockets-rails3'
gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
group :development do
  gem "better_errors"
  gem "binding_of_caller"

  gem 'rspec-rails'
  gem "rails-erd"
  gem 'annotate', ">=2.5.0"

  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-livereload'
  gem 'guard-migrate'

  gem 'headless'
  unless ENV["CI"]
    #gem 'ruby-debug', :platform => :mri_18
    #gem 'debugger', :platform => :mri_19
  end
end

group :test do
  gem 'capybara'
  gem 'spork'
  gem 'database_cleaner'
  gem 'fuubar'
  gem 'ffaker'
  gem 'guard-spork'
  if RUBY_PLATFORM.downcase.include?("darwin")
    gem 'rb-fsevent', :require => false
    gem 'growl' # also install growlnotify from the Extras/growlnotify/growlnotify.pkg in Growl disk image
  end
  if RUBY_PLATFORM.downcase.include?("linux")
    gem 'rb-inotify', :require => false
    gem 'libnotify'
  end
  if RUBY_VERSION.to_f >= 1.9
    gem 'factory_girl_rails', '~> 3.0.0'
  else
    gem 'factory_girl_rails', '~> 1.7.0'
  end  
end

group :production do
  gem 'thin'
  gem 'god'
  gem 'unicorn', :platform => :ruby
end