# Change log

## master (unreleased)

### New Features

* Default `rake` task to run tests
* Add check by `markdownlint` in CI
* Add check by `rubocop` in CI
* Add `rubocop-rake` support
* Fixes from update `rubocop` to `0.89.1`
* Add support of `parallel_rspec` to speed-up tests
* Add missing docs and CI check that 100% code documented

### Changes

* Use GitHub Actions instead of TravisCI
* Use `simplecov` instead of `codecov` for test covarage
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

* Add parsing bmp stream for multipage pdf's
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
