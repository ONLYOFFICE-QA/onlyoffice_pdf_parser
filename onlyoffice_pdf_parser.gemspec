$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'onlyoffice_pdf_parser/version'
Gem::Specification.new do |s|
  s.name = 'onlyoffice_pdf_parser'
  s.version = Version::STRING
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 1.9'
  s.authors = ['Pavel Lobashov', 'Dmitry Rotaty']
  s.summary = 'ONLYOFFICE Testrail Wrapper Gem'
  s.description = 'Wrapper for Testrail by OnlyOffice'
  s.email = ['shockwavenn@gmail.com', 'kvazilife@gmail.com']
  s.files = `git ls-files lib LICENSE.txt README.md`.split($RS)
  s.homepage = 'https://github.com/onlyoffice-testing-robot/onlyoffice_pdf_parser'
  s.license = 'AGPL-3.0'
end
