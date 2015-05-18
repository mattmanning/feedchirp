require 'sidekiq/web'

Sidekiq::Web.use Rack::Auth::Basic do |username, password|
  username == ENV['SIDEKIQ_USERNAME'] && password == ENV['SIDEKIQ_PASSWORD']
end

Sidekiq.configure_server do |config|
  config.redis = { url: "redis://:#{ENV['REDIS_ENV_REDIS_PASSWORD']}@#{ENV['REDIS_PORT_6379_TCP_ADDR']}:#{ENV['REDIS_PORT_6379_TCP_PORT']}/#{ENV['REDIS_ENV_REDIS_DATABASE']}" }
end

Sidekiq.configure_client do |config|
  config.redis = { url: "redis://:#{ENV['REDIS_ENV_REDIS_PASSWORD']}@#{ENV['REDIS_PORT_6379_TCP_ADDR']}:#{ENV['REDIS_PORT_6379_TCP_PORT']}/#{ENV['REDIS_ENV_REDIS_DATABASE']}" }
end
