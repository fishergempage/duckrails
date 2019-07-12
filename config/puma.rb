workers ENV.fetch("PUMA_WORKERS") { 2 }.to_i
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

preload_app!

rackup DefaultRackup
port ENV["PORT"] || 3000
environment ENV["RACK_ENV"] || "development"

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
