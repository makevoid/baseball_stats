require 'bundler/setup'
Bundler.require :default


# infer path
path = File.expand_path "../../", __FILE__
PATH = path


# setup datamapper
environment = ENV["app_env"] || "development"
DataMapper.setup :default, "sqlite://#{path}/db/baseball_stats_#{environment}.sqlite"

require "#{path}/models/bat"
require "#{path}/models/player"

DataMapper.finalize
