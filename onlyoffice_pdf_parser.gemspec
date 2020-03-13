# frozen_string_literal: true

require_relative 'lib/onlyoffice_pdf_parser/version'

Gem::Specification.new do |s|
  s.name = 'onlyoffice_pdf_parser'
  s.version = OnlyofficePdfParser::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = ['Pavel Lobashov', 'Dmitry Rotaty']
  s.summary = 'ONLYOFFICE PDF Parser Gem'
  s.description = 'Library for parsing, converting and extracting PDF data'
  s.homepage = 'https://github.com/onlyoffice-testing-robot/onlyoffice_pdf_parser'
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage
  }
  s.email = %w[shockwavenn@gmail.com kvazilife@gmail.com]
  s.files = Dir['lib/**/*']
  s.add_dependency('image_size', '~> 2')
  s.add_dependency('pdf-reader', '~> 2')
  s.add_dependency('rmagick', '>= 2', '< 5')
  s.add_development_dependency('rake', '~> 13.0')
  s.license = 'AGPL-3.0'
end
