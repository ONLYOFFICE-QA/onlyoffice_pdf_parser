require 'rspec'
require_relative '../../parsers/pdf_parser'

include PdfParser

describe 'Check PDF parser' do
  it 'Check PDF parser | Text without spaces' do
    pdf_info = parse_pdf('PDFText', 'spec/pdf_parser/pdf_examples')
    expect(pdf_info[:pages].first[:text]).to eq('Text')
  end

  it 'Check PDF parser | Text with spaces' do
    pdf_info = parse_pdf('PDFTextWithSpaces', 'spec/pdf_parser/pdf_examples')
    expect(pdf_info[:pages].first[:text]).to eq('Text with spaces')
  end

  it 'Check PDF parser | Text with not custom font' do
    pdf_info = parse_pdf('PDFNotCustomFont', 'spec/pdf_parser/pdf_examples')
    expect(pdf_info[:pages].first[:fonts]).to eq('Times New Roman')
  end

  it 'Check PDF parser | Text with not custom page size' do
    pdf_info = parse_pdf('PDFNotCustomPageSize', 'spec/pdf_parser/pdf_examples')
    expect(pdf_info[:page_size]).to eq('B5')
  end

  it 'Check PDF parser | Check for Glyph error' do # https://github.com/yob/pdf-reader/issues/124
    pdf_info = parse_pdf('pdf_unknown_glyph_width_error', 'spec/pdf_parser/pdf_examples')
    expect(pdf_info[:page_size]).to eq('A4')
  end
end
