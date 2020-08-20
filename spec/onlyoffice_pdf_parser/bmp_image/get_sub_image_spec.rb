# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::BmpImage, '#get_sub_image' do
  it 'Check Sub Image horizontal rectangle square pattern' do
    bmp = described_class.new
    bmp.pixels = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14]]
    bmp.height = 3
    bmp.width = 5
    expect(bmp.get_sub_image(OnlyofficePdfParser::CursorPoint.new(1, 1), 2, 2).pixels).to eq([[6, 7], [11, 12]])
  end

  it 'Check Sub Image horizontal rectangle rectangle pattern' do
    bmp = described_class.new
    bmp.pixels = [[0, 1, 2, 3, 4], [5, 6, 7, 8, 9], [10, 11, 12, 13, 14]]
    bmp.height = 3
    bmp.width = 5
    expect(bmp.get_sub_image(OnlyofficePdfParser::CursorPoint.new(1, 1), 1, 2).pixels).to eq([[6], [11]])
  end

  it 'Check Sub Image vertical rectangle square pattern' do
    bmp = described_class.new
    bmp.pixels = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11], [12, 13, 14]]
    bmp.height = 5
    bmp.width = 3
    expect(bmp.get_sub_image(OnlyofficePdfParser::CursorPoint.new(1, 1), 2, 2).pixels).to eq([[4, 5], [7, 8]])
  end

  it 'Check Sub Image vertical rectangle rectangle pattern' do
    bmp = described_class.new
    bmp.pixels = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [9, 10, 11], [12, 13, 14]]
    bmp.height = 5
    bmp.width = 3
    expect(bmp.get_sub_image(OnlyofficePdfParser::CursorPoint.new(1, 1), 1, 2).pixels).to eq([[4], [7]])
  end
end
