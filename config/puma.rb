workers Integer(ENV["PUMA_WORKERS"] || 2)
threads_count = Integer(ENV["PUMA_LISTEN_PORT"] || 80)
threads threads_count, threads_count

preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
