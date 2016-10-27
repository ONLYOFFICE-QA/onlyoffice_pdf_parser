module OnlyofficePdfParser
  # Module for helper methods for `pdf-reader` gem
  module PdfReaderHelper
    # Return font name from page data
    # @param page [PDF::Reader::Page] page to parse
    # @return [String] font
    def parse_font(page)
      return :unknown if page.fonts[:F1].nil?
      font_string = page.fonts[:F1][:BaseFont].to_s
      font_string = /(?=\+)(.*)/.match(font_string).to_s # remove from "+" to ","
      font_string.delete('+')
    end
  end
end
