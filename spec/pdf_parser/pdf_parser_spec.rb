require 'rspec'
require_relative '../../Helpers/PdfParser'

include PdfParser

describe 'Check PDF parser' do

  it 'Check PDF parser | Text without spaces' do
    pdf_info = parse_pdf('PDFText', $*.first.gsub('/pdf_parser_spec.rb', ''))
    pdf_info[:pages].first[:text].should == 'Text'
  end

  it 'Check PDF parser | Text with spaces' do
    pdf_info = parse_pdf('PDFTextWithSpaces', $*.first.gsub('/pdf_parser_spec.rb', ''))
    pdf_info[:pages].first[:text].should == 'Text with spaces'
  end

  it 'Check PDF parser | Text with not custom font' do
    pdf_info = parse_pdf('PDFNotCustomFont', $*.first.gsub('/pdf_parser_spec.rb', ''))
    pdf_info[:pages].first[:fonts].should == 'Times New Roman'
  end

  it 'Check PDF parser | Text with not custom page size' do
    pdf_info = parse_pdf('PDFNotCustomPageSize', $*.first.gsub('/pdf_parser_spec.rb', ''))
    pdf_info[:page_size].should == 'B5'
  end
end