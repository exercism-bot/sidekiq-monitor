$stdout.sync = true
$stderr.sync = true

require 'sinatra/base'
require 'sinatra/json'

module SidekiqMonitor
  class Application < Sinatra::Base
    get '/sanity' do
      json(ruok: :yes)
    end
  end
end
