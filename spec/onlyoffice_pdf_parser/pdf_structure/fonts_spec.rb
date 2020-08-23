# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::PdfStructure do
  it 'Check PDF parser | Text with not custom font' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/PDFNotCustomFont.pdf')
    expect(pdf_info[:pages].first[:fonts]).to eq('Times New Roman,Regular_Embedded')
  end

  it 'Check PDF parser | Check for font in 1.7' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/pdf_font_1.7.pdf')
    expect(pdf_info[:pages].first[:fonts]).to eq('Andale Mono')
  end
end
