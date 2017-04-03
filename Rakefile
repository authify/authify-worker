require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard'
require 'authify/worker'
require 'resque/tasks'

RSpec::Core::RakeTask.new(:spec)
RuboCop::RakeTask.new(:rubocop)
YARD::Rake::YardocTask.new

task default: %i(spec rubocop yard)

namespace :docker do
  desc 'Build a fresh docker image'
  task :build do
    exec 'docker build -t authify/worker .'
  end
end
