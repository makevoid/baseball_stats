require 'bundler/setup'
Bundler.require :default


# infer path
path = File.expand_path "../../", __FILE__
PATH = path

class BaseballStats
end


# setup datamapper
environment = ENV["app_env"] || "development"
DataMapper.setup :default, "sqlite://#{path}/db/baseball_stats_#{environment}.sqlite"

require "#{path}/models/player"
require "#{path}/models/bat"

DataMapper.finalize



# load libs
require "#{path}/lib/loader"

