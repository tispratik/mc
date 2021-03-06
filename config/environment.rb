RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.active_record.colorize_logging = false
  config.active_record.timestamped_migrations = false
  
  config.time_zone = 'UTC'

  config.gem 'haml'
  config.gem 'will_paginate'
  config.gem 'email_veracity'
  config.gem 'url_store'
  config.gem 'delayed_job'
  config.gem 'thinking-sphinx', :lib => 'thinking_sphinx'
  config.gem 'ts-delayed-delta', :lib => false
  config.gem 'searchlogic'
end

Delayed::Worker.backend = :active_record
ActionView::Base.sanitized_allowed_tags.delete 'div'

require 'paperclip'
require 'thinking_sphinx/deltas/delayed_delta'

UrlStore.defaults = {:secret => '55sfsasfjhjhj'}

# hack for using Time.zone.now instead of Time.now
class Date
  def self.today
    current
  end
end

ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS[:default] = "%B %d, %Y %H:%M"
ActiveSupport::CoreExtensions::Date::Conversions::DATE_FORMATS[:default] = '%Y-%m-%d'