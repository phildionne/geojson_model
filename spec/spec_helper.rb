require 'coveralls'
Coveralls.wear!

require 'pry'
$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'geojson_model'

Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].map(&method(:require))

RSpec.configure do |config|
  config.filter_run focus: true
  config.filter_run_excluding skip: true
  config.run_all_when_everything_filtered = true
end
