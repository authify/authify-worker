# External Requirements
require 'authify/core'
require 'authify/core/jobs/email'

module Authify
  # The Authify::Worker module
  module Worker
    CONFIG = Core::CONFIG.merge(
      db: {
        url: ENV['AUTHIFY_DB_URL'] || 'mysql2://root@localhost:3306/authifydb'
      },
      redis: {
        host: ENV['AUTHIFY_REDIS_HOST'] || 'localhost',
        port: ENV['AUTHIFY_REDIS_PORT'] || '6379'
      }
    )
  end
end

redis_config = Authify::Worker::CONFIG[:redis]
Resque.redis = "#{redis_config[:host]}:#{redis_config[:port]}"

# Internal Requirements
require 'authify/worker/version'
