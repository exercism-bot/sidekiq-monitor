require 'mandate'
require 'zeitwerk'
loader = Zeitwerk::Loader.for_gem
loader.setup

module SidekiqMonitor
  class Error < StandardError; end
end
