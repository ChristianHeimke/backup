Model.new(:postgres, 'db backup') do
  compress_with Gzip
  notify_by Slack 
  encrypt_with OpenSSL

  database PostgreSQL do |db|
    db.name               = ENV['POSTGRES_DATABASE']  || :all
    db.username           = ENV['POSTGRES_USERNAME']  
    db.password           = ENV['POSTGRES_PASSWORD']  
    db.host               = ENV['POSTGRES_HOST']  
    db.port               = ENV['POSTGRES_PORT']      || 5432
    db.additional_options = ENV['POSTGRES_OPTIONS']   || []
  end

  store_with SFTP do |server|    
    server.keep          = ENV['POSTGRES_KEEP']       || 5
  end

  if ENV.has_key?('LOCAL_STORAGE_PATH')
    store_with Local do |local|
      local.keep = ENV['RAILS_KEEP_LOCAL'] || 5
    end
  end

end