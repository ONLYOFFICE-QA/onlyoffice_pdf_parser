# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::BmpImage, '#get_sub_image' do
  it 'Check Sub Image horizontal rectangle square pattern' do
    bmp = described_class.new(nil, height: 3, width: 5)
    bmp.pixels = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14]]
    expect(bmp.get_sub_image(OnlyofficePdfParser::CursorPoint.new(1, 1), 2, 2).pixels).to eq([[6, 7], [11, 12]])
  end

  it 'Check Sub Image horizontal rectangle rectangle pattern' do
    bmp = described_class.new(nil, height: 3, width: 5)
    bmp.pixels = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14]]
    expect(bmp.get_sub_image(OnlyofficePdfParser::CursorPoint.new(1, 1), 1, 2).pixels).to eq([[6], [11]])
  end

  it 'Check Sub Image vertical rectangle square pattern' do
    bmp = described_class.new(nil, height: 5, width: 3)
    bmp.pixels = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11], [12, 13, 14]]
    expect(bmp.get_sub_image(OnlyofficePdfParser::CursorPoint.new(1, 1), 2, 2).pixels).to eq([[4, 5], [7, 8]])
  end

  it 'Check Sub Image vertical rectangle rectangle pattern' do
    bmp = described_class.new(nil, height: 3, width: 5)
    bmp.pixels = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11], [12, 13, 14]]
    expect(bmp.get_sub_image(OnlyofficePdfParser::CursorPoint.new(1, 1), 1, 2).pixels).to eq([[4], [7]])
  end
end
