require 'pdf/reader'

class PdfStructure
  attr_accessor :pages
  attr_accessor :page_size

  def initialize(pages: [], page_size: nil)
    @pages = pages
    @page_size = page_size
  end

  def [](parameter)
    case parameter
    when :pages
      @pages
    when :page_size
      @page_size
    else
      raise "Unknown instance variable - #{parameter}."
    end
  end

  PAGE_SIZE_FOR_PDF = { 'US Letter' => '612 x 792',
                        'US Legal' => '612 x 1008',
                        'A4' => '595.276 x 841.89',
                        'A5' => '419.811 x 594.992',
                        'B5' => '498.898 x 708.945',
                        'Envelope #10' => '297.071 x 684',
                        'Envelope DL' => '312.094 x 623.906',
                        'Tabloid' => '792 x 1223.72',
                        'A3' => '841.89 x 1190.83',
                        'Tabloid Oversize' => '864 x 1295.72',
                        'ROC 16K' => '557.858 x 773.858',
                        'Envelope Choukei 3' => '339.874 x 665.858',
                        'Super B/A3' => '936 x 1367.72',

                        'Landscape US Letter' => '792 x 612',
                        'Landscape US Legal' => '1008 x 612',
                        'Landscape A4' => '841.89 x 595.276',
                        'Landscape A5' => '594.992 x 419.811',
                        'Landscape B5' => '708.945 x 498.898',
                        'Landscape Envelope #10' => '684 x 297.071',
                        'Landscape Envelope DL' => '623.906 x 312.094',
                        'Landscape Tabloid' => '1223.72 x 792',
                        'Landscape A3' => '1190.83 x 841.89',
                        'Landscape Tabloid Oversize' => '1295.72 x 864',
                        'Landscape ROC 16K' => '773.858 x 557.858',
                        'Landscape Envelope Choukei 3' => '665.858 x 339.874',
                        'Landscape Super B/A3' => '1367.72 x 936' }.freeze

  def self.parse(filename)
    pdfinfo = `pdfinfo "#{filename}"` # get info about pdf
    page_size = PAGE_SIZE_FOR_PDF.key(pdfinfo.split('Page size:')[1].split('pts').first.strip) # change size to format
    file = PdfStructure.new(pages: [], page_size: page_size)
    PDF::Reader.open(filename.to_s) do |reader|
      reader.pages.each do |page|
        font_string = page.fonts[:F1][:BaseFont].to_s unless page.fonts[:F1].nil? # got ine in which font for first paragraph stored
        font_string = /(?=\+)(.*)/.match(font_string) # remove all from "+" to ","

        file.pages << { text: page.text,
                        fonts: font_string.to_s.delete('+') # remove "+" and ","
        }
      end
    end
    file
  end
end

PdfParser = PdfStructure
