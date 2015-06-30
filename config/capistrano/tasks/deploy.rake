namespace :deploy do

  task :app_setup do
    on roles(:all) do
      execute "#{current_path}/yii migrate --interactive=0"
      execute "chmod 777 #{current_path}/web/assets"
    end
  end

  after :finishing, 'deploy:app_setup'

end
