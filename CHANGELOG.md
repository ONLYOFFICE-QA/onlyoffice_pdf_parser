# Change log

## master (unreleased)

### New Features

* Add `ruby-3.4` to CI

### Fixes

* Fix missing dependencies in README.md
* Run `rubocop` in CI through `bundle exec`

### Changes

* Remove `ruby-3.0` from CI, since it's EOLed

## 0.6.0 (2024-05-17)

### New Features

* Add `ruby-3.2` to CI
* Add `ruby-3.3` to CI
* Add `dependabot` check for `GitHub Actions`

### Changes

* Drop support `ruby-2.6`, `ruby-2.7` since it's EOL'ed
* Allow `rmagick-6.x` usage as dependency

### Fixes

* Fix warning about license name on `gem build`
* Fix warning about homepage on `gem build` stage

## 0.5.0 (2022-10-10)

### New Features

* Add `yamllint` check in CI

### Changes

* Remove `codeclimate` config, since we don't use it any more.
* Check `dependabot` at 8:00 Moscow time daily
* Drop `ruby-2.5` support since it's EOL'ed
* Do not include `Magic` namespace in `BmpImage`

### Fixes

* Fix minor typos in documentation

## 0.4.0 (2021-01-21)

### New Features

* Add `ruby-3.0` to CI
* Add `ruby-3.1` to CI

### Changes

* Require `mfa` for releasing gem
* Improve `branch` coverage to 100%
* Fix code issues find by rubocop `v1.24.0`
* Remove `ruby-2.5` from CI since it's EOLed
* Require `image_size` gem version ~> 3

## 0.3.0 (2020-11-20)

### New Features

* Add `dependabot` config

### Changes

* Allow failures on `ruby-head` in CI
* Store all dependencies versions in `Gemfile.lock`
* Move repo to `ONLYOFFICE-QA` organization

## 0.2.1 (2020-08-23)

### Fixes

* Fix incorrect username for GitHub Packages

## 0.2.0 (2020-08-23)

### New Features

* Default `rake` task to run tests
* Add check by `markdownlint` in CI
* Add check by `rubocop` in CI
* Add `rubocop-rake` support
* Fixes from update `rubocop` to `0.89.1`
* Add support of `parallel_rspec` to speed-up tests
* Add missing docs and CI check that 100% code documented
* Add info to README about installing `pdfinfo`

### Changes

* Use GitHub Actions instead of TravisCI
* Use `simplecov` instead of `codecov` for test coverage
* Freeze specific `rubocop` and it's extensions versions in `gemspec`
* Drop ruby 2.4 support, since it's EOLed
* Store gem name in const and use it from there
* All dev dependencies frozen in `gemspec`

## 0.1.2 (2020-03-13)

### Fixes

* Fix command to push gem to github package

## 0.1.1 (2020-03-13)

### New features

* Add task for release gem on rubygems and github
* Add more info in gem spec (like metadata)

### Fixes

* Fix gem description

## 0.1.0 (2020-03-13)

### New features

* Add parsing bmp stream for multipage PDFs
* Update `image-size` gem dependency to version 2
* Redone parsing of page size (allow minor diff)
* Add `PdfStructure#page_size_points` to get page size in points
* Add rake tasks for releasing gem

### Fixes

* Fix detecting landscape sizes

### Removal

* Remove unused `BmpImage#get_sub_image_center_array`
* Remove ability to compare `CursorPoint` and `Coordinates`.
* Remove deprecated `PdfStructure#bmp_stream`
