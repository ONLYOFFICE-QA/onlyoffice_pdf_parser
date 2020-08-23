# Onlyoffice PDF Parser

It is gem for parsing pdf files.

## Installation

1. Install `pdfinfo` app, part of `poppler-utils`

   * Debian-Based Linux:

       ```shell script
       sudo apt-get install poppler-utils
       ```

   * Fedora-Based Linux:

       ```shell script
       sudo yum install poppler-utils
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
