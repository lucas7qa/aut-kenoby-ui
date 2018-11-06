require 'rspec'
require 'cucumber'
require 'selenium/webdriver'
require 'capybara/dsl'
require 'byebug'
require 'faker'
require 'site_prism'
require 'rspec'
require 'yaml'
require 'pry'
require 'httparty'
require_relative '../../features/support/helpers.rb'

include Capybara::DSL
include Helpers

LOGIN = YAML.load_file("config/user.yml")

Capybara.register_driver :selenium do |app|
  args = ["--use-fake-device-for-media-stream", "--use-fake-ui-for-media-stream" ]
  Capybara::Selenium::Driver.new(app, { browser: :chrome, args: args })
end

Capybara.current_driver = :selenium
Capybara.default_max_wait_time = 10
#Capybara.page.driver.browser.manage.window.maximize

page = lambda {|klass| klass.new}

Before do
  Capybara.reset_sessions!
  @page = page
end