require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
require 'spree/testing_support/common_rake'

module TempFixForRakeLastComment
  def last_comment
    last_description
  end 
end
Rake::Application.send :include, TempFixForRakeLastComment


RSpec::Core::RakeTask.new

task :default => [:spec]

desc 'Generates a dummy app for testing'
task :test_app do
  ENV['LIB_NAME'] = 'spree_drop_ship'
  Rake::Task['common:test_app'].invoke 'Spree::User'
end

task :test_app do
  ENV['LIB_NAME'] = 'spree_drop_ship'
end




