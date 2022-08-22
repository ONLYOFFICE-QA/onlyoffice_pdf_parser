# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::PdfStructure do
  it 'Check filename attribute' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/PDFText.pdf')
    expect(pdf_info.file_path).to eq('spec/pdf_examples/PDFText.pdf')
  end

  it 'Check PDF parser | Text without spaces' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/PDFText.pdf')
    expect(pdf_info[:pages].first[:text]).to eq('Text')
  end

  it 'PdfStructure raise exception on incorrect param' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/PDFText.pdf')
    expect { pdf_info[:foo] }.to raise_error(/foo/)
  end

  it 'Check PDF parser | Text with spaces' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/PDFTextWithSpaces.pdf')
    expect(pdf_info[:pages].first[:text]).to eq('Text with spaces')
  end

  it 'Incorrect pdf from Ilya.Kirillov with missed xref' do
    expect { OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/xref_not_defined.pdf') }
      .to raise_error PDF::Reader::MalformedPDFError
  end

  it 'Empty font name' do
    # This is because sometimes text cannot be saved as font object and saves as image
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/empty_font_name.pdf')
    expect(pdf_info[:pages].first[:text]).to be_empty
  end
end
