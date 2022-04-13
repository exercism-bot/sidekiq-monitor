require_relative 'base'

module SidekiqMonitor
  class ApexTest < TestSystemBase
    def test_for_alive
      AmIAlive.stubs(:call).returns(true)

      get '/'

      assert_equal 200, last_response.status
      assert_equal('good'.to_json, last_response.body)
    end

    def test_for_dead
      AmIAlive.stubs(:call).returns(false)

      get '/'

      assert_equal 500, last_response.status
      assert_equal('bad'.to_json, last_response.body)
    end
  end
end
