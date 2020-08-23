# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::BmpImage, '#get_sub_image_array' do
  it 'Find self' do
    file = described_class.new('spec/bmp_image_examples/SE_top_left_edge_canvas.bmp')
    pattern = 'spec/bmp_image_examples/SE_top_left_edge_canvas.bmp'
    expect(file.get_sub_image_array(pattern)).to eq([OnlyofficePdfParser::CursorPoint.new(0, 0)])
  end

  it 'Find almost all image pattern in spreadsheet' do
    file = described_class.new('spec/bmp_image_examples/SE_screenshot.bmp')
    pattern = 'spec/bmp_image_examples/SE_screenshot_without_top_and_left.bmp'
    expect(file.get_sub_image_array(pattern)).to eq([OnlyofficePdfParser::CursorPoint.new(1, 1)])
  end

  it 'Find font name canvas pattern in spreadsheet' do
    file = described_class.new('spec/bmp_image_examples/SE_screenshot.bmp')
    pattern = 'spec/bmp_image_examples/SE_font_name.bmp'
    expect(file.get_sub_image_array(pattern)).to eq([OnlyofficePdfParser::CursorPoint.new(136, 37)])
  end

  it 'Find left and top canvas part pattern in spreadsheet' do
    file = described_class.new('spec/bmp_image_examples/SE_screenshot.bmp')
    pattern = 'spec/bmp_image_examples/SE_top_left_edge_canvas.bmp'
    expect(file.get_sub_image_array(pattern)).to eq([OnlyofficePdfParser::CursorPoint.new(39, 111)])
  end

  it 'Find left and top canvas part pattern without show row names' do
    file = described_class.new('spec/bmp_image_examples/SE_screenshot.bmp')
    pattern = 'spec/bmp_image_examples/SE_top_left_edge_hide_headlines.bmp'
    expect(file.get_sub_image_array(pattern)).to eq([OnlyofficePdfParser::CursorPoint.new(38, 86)])
  end
end
