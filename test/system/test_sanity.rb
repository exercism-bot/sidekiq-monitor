require_relative 'base'

module SidekiqMonitor
  class SanityTest < TestSystemBase
    def test_sanity
      get '/sanity'

      assert_equal 200, last_response.status
      assert_equal({ ruok: true }.to_json, last_response.body)
    end
  end
end
