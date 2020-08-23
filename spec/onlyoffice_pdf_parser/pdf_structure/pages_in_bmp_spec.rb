# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::PdfStructure, '#pages_in_bmp' do
  it 'convert pdf to bmp' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/empty_font_name.pdf')
    expect(pdf_info.pages_in_bmp.first.length).to be > 1000
  end

  it 'convert pdf to bmp file with space' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/space in font name.pdf')
    expect(pdf_info.pages_in_bmp.first.length).to be > 1000
  end
end
