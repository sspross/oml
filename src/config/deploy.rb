require 'bundler/capistrano'

set :application, "oml"

role :app, "orwell.ch"
role :web, "orwell.ch"
role :db,  "orwell.ch", :primary => true

# deploy
set :deploy_to, "/home/sspross/projects/#{application}"
set :user, "sspross"
set :use_sudo, false

# scm
set :scm, :git
set :repository, "git://github.com/sspross/semesterarbeit.git"
set :branch, "develop"

# deploy task
namespace :deploy do
  desc "Tell Passenger to restart the app."
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end