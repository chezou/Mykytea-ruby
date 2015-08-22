require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rake/clean'

CLEAN.include('ext/**/*{.o,.log,.so,.bundle}')
CLEAN.include('ext/**/Makefile')
CLOBBER.include('lib/*{.so,.bundle}')

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
