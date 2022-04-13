$stdout.sync = true
$stderr.sync = true

require 'sinatra/base'
require 'sinatra/json'

module SidekiqMonitor
  class Application < Sinatra::Base
    get '/' do
      if AmIAlive.call
        status(200)
        json({ alive: true })
      else
        status(500)
        json({ alive: false })
      end
    end

    get '/sanity' do
      json(ruok: true)
    end
  end
end
