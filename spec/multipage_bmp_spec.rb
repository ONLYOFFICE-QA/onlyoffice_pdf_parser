# frozen_string_literal: true

require 'spec_helper'

describe 'Multipage Bmp' do
  it 'Parsing bmp streams of multipage pdf' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/multipage.pdf')
    expect(pdf_info.pages_in_bmp.length).to eq(2)
  end

  it 'contain_pattern for multipage doc' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/multipage.pdf')
    expect(pdf_info).not_to be_contain_pattern('spec/pdf_examples/pdf_gridlines_pattern.bmp')
  end
end
