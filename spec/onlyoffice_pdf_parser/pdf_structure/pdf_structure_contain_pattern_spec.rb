# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::PdfStructure, '#contain_pattern' do
  it 'check pdf for pattern' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/pdf_gridlines.pdf')
    expect(pdf_info).to be_contain_pattern('spec/pdf_examples/pdf_gridlines_pattern.bmp')
  end
end
