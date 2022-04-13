require 'test_helper'
require 'rack/test'

module SidekiqMonitor
  class TestSystemBase < Minitest::Test
    include Rack::Test::Methods

    def app
      Application.new
    end
  end
end
