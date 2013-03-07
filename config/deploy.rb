require 'debugger'

set :stages, %w(octopus)
set :default_stage, "octopus"
require 'capistrano/ext/multistage'

set :application, "bigwhat"
set :scm, "git"

# TODO: Set this within a multi-stage deploy.
set :repository,  File.join(File.expand_path('..', File.dirname(__FILE__)), ".git")

set :deploy_via, :copy
set :copy_cache, false

require "tmpdir"
set :copy_dir, Dir.mktmpdir('local-')
set :copy_remote_dir, Dir.mktmpdir('remote-')

default_run_options[:pty] = true
set :user, `whoami`.chomp
set :group, `id -ng`.chomp
set :deploy_to, File.expand_path('../../../dummydep', File.dirname(__FILE__))

set :release_name do
  set :deploy_timestamped, true
  [Time.now.utc.strftime("%Y%m%d%H%M%S"), deployment_id].join('-')
end if defined?(:deployment_id)

set :build_script, 'touch built'
