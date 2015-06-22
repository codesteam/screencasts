# Config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'screencasts'

# Repository settings
set :repo_url, 'git@github.com:codesteam/screencasts.git'
set :scm, :git
set :branch, 'master'

# Deploy directory on remote server
set :deploy_to, '/home/dev/app_core'

# Store only 5 releases
set :keep_releases, 5

# Shared directories between releases
set :linked_dirs, %w{ vendor runtime/logs web/assets }

# Install all packages from composer file
set :composer_install_flags, '--optimize-autoloader'
