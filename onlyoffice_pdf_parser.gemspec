# frozen_string_literal: true

require_relative 'lib/onlyoffice_pdf_parser/name'
require_relative 'lib/onlyoffice_pdf_parser/version'

Gem::Specification.new do |s|
  s.name = OnlyofficePdfParser::Name::STRING
  s.version = OnlyofficePdfParser::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 2.7'
  s.authors = ['Pavel Lobashov', 'Dmitry Rotaty']
  s.summary = 'ONLYOFFICE PDF Parser Gem'
  s.description = 'Library for parsing, converting and extracting PDF data'
  s.homepage = 'https://github.com/ONLYOFFICE-QA/' \
               "#{s.name}"
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }
  s.email = %w[shockwavenn@gmail.com kvazilife@gmail.com]
  s.files = Dir['lib/**/*']
  s.add_dependency('image_size', '>= 2', '< 4')
  s.add_dependency('pdf-reader', '~> 2')
  s.add_dependency('rmagick', '>= 4', '< 6')
  s.add_development_dependency('overcommit', '~> 0')
  s.add_development_dependency('parallel_tests', '~> 3')
  s.add_development_dependency('rake', '~> 13')
  s.add_development_dependency('rspec', '~> 3')
  s.add_development_dependency('rubocop', '~> 1')
  s.add_development_dependency('rubocop-performance', '~> 1')
  s.add_development_dependency('rubocop-rake', '~> 0')
  s.add_development_dependency('rubocop-rspec', '~> 2')
  s.add_development_dependency('simplecov', '~> 0')
  s.add_development_dependency('yard', '>= 0.9.20')
  s.license = 'AGPL-3.0'
end
