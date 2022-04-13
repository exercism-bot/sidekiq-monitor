require 'sidekiq/api'
require 'exercism-config'

Sidekiq.configure_server do |config|
  config.redis = { :url => ::Exercism.config.sidekiq_redis_url }
end   

Sidekiq.configure_client do |config|
  config.redis = { :url => ::Exercism.config.sidekiq_redis_url }
end   

module SidekiqMonitor
  class AmIAlive
    include Mandate

    def call()
      Sidekiq::ProcessSet.new.any?
    end
  end
end