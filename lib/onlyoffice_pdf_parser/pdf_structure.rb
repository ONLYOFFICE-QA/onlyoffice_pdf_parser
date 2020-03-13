# frozen_string_literal: true

require 'pdf/reader'
require 'tempfile'
require_relative 'helpers/file_helper'
require_relative 'pdf_structure/pdf_reader_helper'
require_relative 'pdf_structure/pdf_convert_to_bmp_helper'

module OnlyofficePdfParser
  # Class for working and parsing PDF files
  class PdfStructure
    include PdfConvertToBmpHelper
    include PdfReaderHelper
    # @return [Array, Pages] array of pages
    attr_accessor :pages
    # @return [String] full path to file
    attr_accessor :file_path
    # @return [Array<String>] bin representation of bmps
    attr_reader :pages_in_bmp

    def initialize(pages: [], file_path: nil)
      @file_path = file_path
      @pages = pages
      @pages_in_bmp = []
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

    # @return [True, false] Check if pdf file contains graphic pattern
    def contain_pattern?(path_to_patter)
      pages_in_bmp.each do |current_page|
        bmp = BmpImage.new(current_page)
        array = bmp.get_sub_image_array(path_to_patter)
        return true unless array.empty?
      end
      false
    end

    # Parse file using `pdf-reader` gem
    def pdf_reader_parse
      PDF::Reader.open(file_path.to_s) do |reader|
        reader.pages.each do |page|
          @pages << { text: page.text,
                      fonts: parse_font(page) }
        end
      end
    end

    # @return [Array <Integer>] page size of pdf in points
    def page_size_points
      return @page_size_points if @page_size_points

      pdfinfo = `pdfinfo "#{@file_path}"`
      page_size_fraction = pdfinfo.split('Page size:')[1].split('pts').first.strip.split(', ').first.split(' x ')
      @page_size_points = page_size_fraction.map { |size| size.to_f.round }
    end

    # @return [String, nil] name of page size
    def page_size
      @page_size = PAGE_SIZE_FOR_PDF.key(page_size_points)
      @page_size ||= "Landscape #{PAGE_SIZE_FOR_PDF.key(page_size_points.reverse)}"
    end

    PAGE_SIZE_FOR_PDF = { 'US Letter' => [612, 792],
                          'US Legal' => [612, 1008],
                          'A4' => [595, 842],
                          'A5' => [420, 595],
                          'B5' => [499, 709],
                          'Envelope #10' => [297, 684],
                          'Envelope DL' => [312, 624],
                          'Tabloid' => [792, 1224],
                          'A3' => [842, 1191],
                          'Tabloid Oversize' => [864, 1296],
                          'ROC 16K' => [558, 774],
                          'Envelope Choukei 3' => [340, 666],
                          'Super B/A3' => [936, 1368] }.freeze

    def self.parse(filename)
      file = PdfStructure.new(pages: [], file_path: filename)
      file.pdf_reader_parse
      file.fetch_bmp_binary
      file.page_size
      file
    end
  end

  PdfParser = PdfStructure
end
