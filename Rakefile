# frozen_string_literal: true

require 'bundler/gem_tasks'

desc 'Release gem '
task :release_github_rubygems do
  Rake::Task['release'].invoke
  `gem push --key github \
   --host https://rubygems.pkg.github.com/onlyoffice-testing-robot \
   onlyoffice_pdf_parser-#{OnlyofficePdfParser::Version::STRING}.gem`
end
