# config/deploy.rb
set :application, "myapp"
set :deploy_to, "/Users/rails/myapp"

set :repository,  "git@github.com:a1128ys/myapp"
#set :repository, :origin

default_run_options[:pty] = true
set :scm, :git
set :git, "/usr/local/git/bin/git"
set :git_account, "a1128ys"
set :scm_passphrase, "4jST?zI0"

set :use_sudo, false

role :web, "localhost"
role :app, "localhost"
role :db,  "localhost", :primary => true

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
