# frozen_string_literal: true

require 'spec_helper'

describe 'Check PDF parser' do
  it 'Check filename attribue' do
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

  it 'Check PDF parser | Text with not custom font' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/PDFNotCustomFont.pdf')
    expect(pdf_info[:pages].first[:fonts]).to eq('Times New Roman,Regular_Embedded')
  end

  describe 'Page size' do
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

  it 'Check PDF parser | Check for Glyph error' do # https://github.com/yob/pdf-reader/issues/124
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/pdf_unknown_glyph_width_error.pdf')
    expect(pdf_info[:page_size]).to eq('A4')
  end

  it 'Check PDF parser | Check for font in 1.7' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/pdf_font_1.7.pdf')
    expect(pdf_info[:pages].first[:fonts]).to eq('Andale Mono')
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

  it 'convert pdf to bmp' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/empty_font_name.pdf')
    expect(pdf_info.bmp_stream.length).to be > 1000
  end

  it 'convert pdf to bmp file with space' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/space in font name.pdf')
    expect(pdf_info.bmp_stream.length).to be > 1000
  end

  it 'check pdf for pattern' do
    pdf_info = OnlyofficePdfParser::PdfParser.parse('spec/pdf_examples/pdf_gridlines.pdf')
    expect(pdf_info).to be_contain_pattern('spec/pdf_examples/pdf_gridlines_pattern.bmp')
  end
end
