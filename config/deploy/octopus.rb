target_host   ||= 'localhost'
deploy_to     ||= "/home/rhoward/code/bc/captest/bc/app"

role :web, target_host, :primary => true
role :cdn, target_host, :no_release => true

set :deploy_to, deploy_to

set :user, `id -un`.chomp
set :group, `id -gn`.chomp
