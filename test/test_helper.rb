gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/mock'
require 'mocha/minitest'

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'sidekiq_monitor'
