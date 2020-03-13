# Change log

## master (unreleased)

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
