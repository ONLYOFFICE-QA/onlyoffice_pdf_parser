# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('lib', __dir__)
require 'onlyoffice_pdf_parser/version'
Gem::Specification.new do |s|
  s.name = 'onlyoffice_pdf_parser'
  s.version = OnlyofficePdfParser::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = ['Pavel Lobashov', 'Dmitry Rotaty']
  s.summary = 'ONLYOFFICE Testrail Wrapper Gem'
  s.description = 'Library for parsing, converting and extracting PDF data'
  s.email = ['shockwavenn@gmail.com', 'kvazilife@gmail.com']
  s.files = `git ls-files lib LICENSE.txt README.md`.split($RS)
  s.homepage = 'https://github.com/onlyoffice-testing-robot/onlyoffice_pdf_parser'
  s.add_runtime_dependency('image_size', '~> 2')
  s.add_runtime_dependency('pdf-reader', '~> 2')
  s.add_runtime_dependency('rmagick', '>= 2', '< 5')
  s.license = 'AGPL-3.0'
end
