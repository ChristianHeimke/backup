Model.new(:rails, 'rails backup') do
  compress_with Gzip
  notify_by Slack 
  encrypt_with OpenSSL

  archive :rails do |archive|
    archive.add ENV['RAILS_PATH']
  end

  store_with SFTP do |server|
    server.keep = ENV['RAILS_KEEP'] || 5
  end

  if ENV.has_key?('LOCAL_STORAGE_PATH')
    store_with Local do |local|
      local.keep = ENV['RAILS_KEEP_LOCAL'] || 5
    end
  end

end