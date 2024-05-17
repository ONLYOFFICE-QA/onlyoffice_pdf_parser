# frozen_string_literal: true

require_relative 'lib/onlyoffice_pdf_parser/name'
require_relative 'lib/onlyoffice_pdf_parser/version'

Gem::Specification.new do |s|
  s.name = OnlyofficePdfParser::Name::STRING
  s.version = OnlyofficePdfParser::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0'
  s.authors = ['Pavel Lobashov', 'Dmitry Rotaty']
  s.summary = 'ONLYOFFICE PDF Parser Gem'
  s.description = 'Library for parsing, converting and extracting PDF data'
  s.homepage = 'https://github.com/ONLYOFFICE-QA/' \
               "#{s.name}"
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }
  s.email = %w[shockwavenn@gmail.com kvazilife@gmail.com]
  s.files = Dir['lib/**/*']
  s.add_dependency('image_size', '>= 2', '< 4')
  s.add_dependency('pdf-reader', '~> 2')
  s.add_dependency('rmagick', '>= 4', '< 7')
  s.license = 'AGPL-3.0-or-later'
end
