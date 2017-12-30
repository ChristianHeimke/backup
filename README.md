# backup for docker

This docker image is a basic version and configuration to backup a Ruby on Rails 
project via `backup` gem [1].
It will backup a postgres database and ruby on rails path in time via cron. 
The database should belinked to the container, and the rails path mounted as volume. 
The storage has been configured via SFTPm you got notifications via Slack,

## Versions

### v4
Uses backup gem v4.4.x and postgresql 9.5.x

### v5.beta
Uses backup gem v5.x beta and postgresql 9.6.x

## Usage
Feel free to change the config for your needs and rebuild the image:

```
docker build -t <name> .
```

You have to pass some ENV vars (see below) to run it successfully. It has been
tested in an rancher environment.

## Configuration params

| ENV var name        | description           | default   |
| ------------------- |-----------------------|-----------|
| ENVCRYPTION_KEY     | password for openssl  |           |
| SFTP_USERNAME       | username for sftp     |           |
| SFTP_PASSWORD       | password for sftp     |           |
| SFTP_HOST           | sftp host or ip       |           |
| SFTP_PORT           | sftp port             | 22        |
| SFTP_PATH           | sftp path             | ~/        |
| LOCAL_STORAGE_PATH  | path to shared volume |           |
| SLACK_URL           | incomming web hook url|           |
| SLACK_ON_SUCCESS    | post on success       | true      |
| SLACK_ON_WARNING    | post on warning       | true      |
| SLACK_ON_FAILURE    | post on failue        | true      |
| ENABLE_POSTGRES_BACKUP| enable postgres     |           |
| CRON_POSTGRES       | cron string to run    |           |
| POSTGRES_DATABASE   | DB name               |           |
| POSTGRES_USERNAME   | DB user               |           |
| POSTGRES_PASSWORD   | DB password           |           |
| POSTGRES_HOST       | DB host               |           |
| POSTGRES_PORT       | DB port               | 5432      |
| POSTGRES_OPTIONS    | backup options        |           |
| POSTGRES_KEEP       | backup count          | 5         |
| POSTGRES_KEEP_LOCAL | backup count          | 5         |
| ENABLE_RAILS_BACKUP | enable postgres       |           |
| CRON_RAILS          | cron string to run    |           |
| RAILS_PATH          | volume mount path     |           |
| RAILS_KEEP          | backup count          | 5         |
| RAILS_KEEP_LOCAL    | backup count          | 5         |



[1] http://backup.github.io/backup/v4/