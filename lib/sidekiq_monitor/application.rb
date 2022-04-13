$stdout.sync = true
$stderr.sync = true

require 'sinatra/base'
require 'sinatra/json'

module SidekiqMonitor
  class Application < Sinatra::Base
    get '/' do
      if AmIAlive.()
        status(200)
        json('good')
      else
        status(500)
        json('bad')
      end
    end

    get '/sanity' do
      json(ruok: true)
    end
  end
end
