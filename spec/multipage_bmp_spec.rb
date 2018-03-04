require 'spec_helper'

describe 'Multipage Bmp' do
  it 'Parsing bmp streams of multipage pdf' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/multipage.pdf')
    expect(pdf_info.pages_in_bmp.length).to eq(2)
  end
end
