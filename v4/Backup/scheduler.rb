require 'rufus-scheduler'
scheduler = Rufus::Scheduler.singleton

if ENV['ENABLE_RAILS_BACKUP'] == 'true'
  scheduler.cron ENV['CRON_RAILS'] do
    %x[ backup perform -t rails --root-path /backup ]
  end
end

if ENV['ENABLE_POSTGRES_BACKUP'] == 'true'
  scheduler.cron ENV['CRON_POSTGRES'] do
    %x[ backup perform -t postgres --root-path /backup ]
  end
end

scheduler.join
