set :application, "bigwhat"
set :scm, "git"

# TODO: Set this within a multi-stage deploy.
set :repository,  File.join(File.expand_path('..', File.dirname(__FILE__)), ".git")

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

server "localhost", :web, :app, :db
#server "localhost", :cache

default_run_options[:pty] = true
set :user, `whoami`.chomp
set :group, `id -ng`.chomp
set :deploy_to, File.expand_path('../../dummydep', File.dirname(__FILE__))

namespace :deploy do
  task :assetize, :roles => [:cache] do
    puts ("lol"*100)
  end
end

after "deploy:finalize_update", "deploy:assetize"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
