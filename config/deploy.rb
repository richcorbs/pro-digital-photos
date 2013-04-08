require 'bundler/capistrano'

default_run_options[:pty] = true

# Defaults
set :application, 'pro-digital-photos'
set :deploy_to, "/home1/prodigi6/www/#{application}"
set :use_sudo, false

# Git
set :repository,  'git@github.com:richcorbs/pro-digital-photos.git'
set :branch, 'master'

# More Git
set :scm, 'git'
set :git_shallow_clone, 1
set :git_enable_submodules, 1

set :user, 'prodigi6'

# Set RAILS_ENV to production
set :rails_env, 'production'

# Configs
role :web, '69.195.124.63'
role :app, '69.195.124.63'
role :db,  '69.195.124.63', :primary => true

# Clean up old deploys
after "deploy", "deploy:cleanup"

# Create .htaccess
after 'deploy:create_symlink', 'pdphotos:uploads_symlink'
after 'deploy:create_symlink', 'pdphotos:drop_htaccess'
after 'deploy:create_symlink', 'pdphotos:database_yml'
after 'deploy:create_symlink', 'pdphotos:restart'


# pdphotos
namespace 'pdphotos' do
  task :drop_htaccess, :roles => :app do
    htaccess = "#{current_path}/public/.htaccess"
    run "
      echo 'Options -MultiViews' > #{htaccess}; \
      echo 'PassengerResolveSymlinksInDocumentRoot on' >> #{htaccess}; \
      echo 'RailsEnv production' >> #{htaccess}; \
      echo 'RackBaseURI /' >> #{htaccess}; \
      echo 'SetEnv GEM_HOME /home1/prodigi6/ruby/gems' >> #{htaccess}; \
    "
  end

  task :database_yml, :roles => :app do
    run "cp ~/secret/database.yml #{current_path}/config/database.yml"
  end

  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :uploads_symlink, :roles => :app do
    run "ln -s #{shared_path}/uploads #{current_path}/public/uploads"
  end

end
