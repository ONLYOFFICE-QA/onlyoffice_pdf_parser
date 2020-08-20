# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::PdfStructure, '#page_size' do
  it 'Check PDF parser | Text with not custom page size' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/page_size/PDFNotCustomPageSize.pdf')
    expect(pdf_info[:page_size]).to eq('B5')
  end

  it 'Landscape A4' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/page_size/landscape_a4.pdf')
    expect(pdf_info[:page_size]).to eq('Landscape A4')
  end

  it 'Check page size in decimal fraction in file' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/page_size/a5_page_size_fraction.pdf')
    expect(pdf_info[:page_size]).to eq('A5')
  end
end
