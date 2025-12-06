require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Code is reloaded between requests.
  config.enable_reloading = true

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "cache-control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system.
  config.active_storage.service = :local

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Highlight code that triggered deprecations in logs.
  config.active_support.disallowed_deprecation = :raise

  # Do not halt on pending migrations.
  config.active_record.migration_error = :page_load

  # Asset debug mode.
  config.assets.debug = true
  config.assets.quiet = true

  # ✅✅✅ Render 用ホスト許可（ここが本命）
  config.hosts.clear
  config.hosts << ".onrender.com"
  config.hosts << "localhost"
end
