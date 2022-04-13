require_relative 'base'
require 'sidekiq/api'

module SidekiqMonitor
  class ApexTest < TestSystemBase
    def test_alive_on_same_hostname
      Sidekiq::ProcessSet.stubs(:new).returns([{ 'hostname' => 'other' }, { 'hostname' => Socket.gethostname }])

      get '/'

      assert_equal 200, last_response.status
      assert_equal({ alive: true }.to_json, last_response.body)
    end

    def test_alive_on_different_hostnames
      Sidekiq::ProcessSet.stubs(:new).returns([{ 'hostname' => 'other' }, { 'hostname' => 'another' }])

      get '/'

      assert_equal 500, last_response.status
      assert_equal({ alive: false }.to_json, last_response.body)
    end

    def test_dead
      Sidekiq::ProcessSet.stubs(:new).returns([])

      get '/'

      assert_equal 500, last_response.status
      assert_equal({ alive: false }.to_json, last_response.body)
    end
  end
end
