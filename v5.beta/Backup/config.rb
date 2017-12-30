# encoding: utf-8

##
# Backup v5.x Configuration
#
# Documentation: http://backup.github.io/backup
# Issue Tracker: https://github.com/backup/backup/issues

Encryptor::OpenSSL.defaults do |encryption|
  encryption.password = ENV['ENVCRYPTION_KEY']
  encryption.base64   = true
  encryption.salt     = true
end

Storage::SFTP.defaults do |server|
  server.username     = ENV['SFTP_USERNAME']
  server.password     = ENV['SFTP_PASSWORD']
  server.ip           = ENV['SFTP_HOST']
  server.port         = ENV['SFTP_PORT']  || 22
  server.path         = ENV['SFTP_PATH']  || '~/'
end

if ENV.has_key?('LOCAL_STORAGE_PATH')
  Storage::Local do |local|
    local.path = ENV['LOCAL_STORAGE_PATH']  
  end
end

Notifier::Slack.defaults do |slack|
  slack.on_success = ENV['SLACK_ON_SUCCESS'] || true 
  slack.on_warning = ENV['SLACK_ON_WARNING'] || true
  slack.on_failure = ENV['SLACK_ON_FAILURE'] || true  

  slack.webhook_url = ENV['SLACK_URL']  
end

Logger.configure do
  # Console options:
  console.quiet = false

  # Syslog options:
  syslog.enabled  = true
  syslog.ident    = 'backup'
end