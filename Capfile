# Specify config path
set :deploy_config_path, 'config/capistrano/deploy.rb'
set :stage_config_path, 'config/capistrano/deploy'

# Load DSL and set up stages
require 'capistrano/setup'

# Include deployment tasks
require 'capistrano/deploy'
require 'capistrano/composer'
require 'capistrano/env/v3'

# Load custom tasks
Dir.glob('config/capistrano/tasks/*.rake').each { |r| import r }
