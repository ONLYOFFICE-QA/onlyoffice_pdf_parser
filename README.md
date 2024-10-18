# Onlyoffice PDF Parser

It is gem for parsing pdf files.

## Installation

This gem requires `pdfinfo` app, part of `poppler-utils`.\
Also `imagemagick` required.

1. Install system dependencies:

   * Debian-Based Linux:

       ```shell script
       sudo apt-get install imagemagick \
                            libmagickwand-dev \
                            poppler-utils
       ```

   * Fedora-Based Linux:

       ```shell script
       sudo dnf install ImageMagick \
                        ImageMagick-devel \
                        poppler-utils
       ```

2. Install gem by command:

    ```shell script
    gem install onlyoffice_pdf_parser
    ```

## Example

```ruby
require 'onlyoffice_pdf_parser'

OnlyofficePdfParser::PdfParser.parse('Text.pdf')

```
