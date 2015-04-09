# Set the name of the application.  This is used to determine directory paths and domains
set :application, 'mobile_library'

#############################################################
#  Application settings
#############################################################

# Defaults are set in lib/hesburgh_infrastructure/capistrano/common.rb

# Repository defaults to "git@git.library.nd.edu:#{application}"
# set :repository, "git@git.library.nd.edu:myrepository"

# Define symlinks for files or directories that need to persist between deploys.
# /log, /vendor/bundle, and /config/database.yml are automatically symlinked
set :application_symlinks, [
  "/config/initializers/refworks_admin.rb"
]

#############################################################
#  Environment settings
#############################################################

set :repo_url, 'https://github.com/ndlib/mobile_library.git'
# Set an environment variable to deploy from a branch other than master
# branch=beta cap staging deploy
set(:branch) {
  name = ENV['branch'] ? ENV['branch'] : 'master'

  if name == 'master'
    set :git_shallow_clone, 1
  end

  puts "Deploying to branch #{name}"
  name
}

set :scm, 'git'
set :scm_command, '/usr/bin/git'

set :user, 'app'
set :ruby_bin, "/opt/ruby/current/bin"

desc "Setup for the Pre-Production environment"
task :pre_production do
  # Customize pre_production configuration
  set :deploy_to, "/home/app/mobile"
  set :domain, "mobilepprd-vm.library.nd.edu"
end

desc "Setup for the production environment"
task :production do
  # Customize production configuration
  set :deploy_to, "/home/app/mobile"
  set :domain, "mobileprod-vm.library.nd.edu"
end

#############################################################
#  Additional callbacks and tasks
#############################################################

# Define any addional tasks or callbacks here


