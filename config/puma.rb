workers Integer(ENV.fetch("PUMA_WORKERS") { 3 })
port Integer(ENV.fetch("PUMA_LISTEN_PORT") { 80 })

preload_app!

on_worker_boot do
  ActiveSupport.on_load(:active_record) do
    ActiveRecord::Base.establish_connection
  end
end
