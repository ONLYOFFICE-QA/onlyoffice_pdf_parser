# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :parallel_rspec

desc 'Release gem '
task :release_github_rubygems do
  Rake::Task['release'].invoke
  `gem push --key github \
   --host https://rubygems.pkg.github.com/onlyoffice-testing-robot \
   pkg/onlyoffice_pdf_parser-#{OnlyofficePdfParser::Version::STRING}.gem`
end

desc 'Run tests in parallel'
task :parallel_rspec do
  sh('parallel_rspec spec/')
end
