require_relative "../../config/env"

DataMapper.auto_migrate!

BaseballStats::Loader.import_data