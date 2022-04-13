require 'socket'
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
      puts "=============================="
      Sidekiq::ProcessSet.new.each {|process| puts process.inspect }
      puts "------------------------------"
      puts "hostname: #{hostname}"
      puts "++++++++++++++++++++++++++++++"
      Sidekiq::ProcessSet.new.any? {|process| process["hostname"] == hostname}
    end

    private
    memoize
    def hostname = Socket.gethostname
  end
end