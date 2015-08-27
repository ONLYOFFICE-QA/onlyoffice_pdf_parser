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
    expect(pdf_info[:pages].first[:fonts]).to eq('Times New Roman,Regular_Embedded')
  end

  it 'Check PDF parser | Text with not custom page size' do
    pdf_info = parse_pdf('PDFNotCustomPageSize', 'spec/pdf_parser/pdf_examples')
    expect(pdf_info[:page_size]).to eq('B5')
  end

  it 'Check PDF parser | Check for Glyph error' do # https://github.com/yob/pdf-reader/issues/124
    pdf_info = parse_pdf('pdf_unknown_glyph_width_error', 'spec/pdf_parser/pdf_examples')
    expect(pdf_info[:page_size]).to eq('A4')
  end

  it 'Check PDF parser | Check for font in 1.7' do
    pdf_info = parse_pdf('pdf_font_1.7', 'spec/pdf_parser/pdf_examples')
    expect(pdf_info[:pages].first[:fonts]).to eq('Andale Mono')
  end

  it 'Export from xlsx' do
    expect { parse_pdf('xref_not_defined', 'spec/pdf_parser/pdf_examples') }.to raise_error PDF::Reader::MalformedPDFError
  end
end
