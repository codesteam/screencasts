role :app, %w{dev@screencast.code-bit.com}

Capistrano::Env.use do |env|
  env.add 'DB_DSN', 'mysql:host=localhost;dbname=screencast'
  env.add 'DB_USER', ''
  env.add 'DB_PASS', ''
  env.filemode = 0644
end