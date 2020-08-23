# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::BmpImage do
  it 'BmpImage to_s equal path to image' do
    image_path = 'spec/bmp_image_examples/SE_screenshot.bmp'
    file = described_class.new('spec/bmp_image_examples/SE_screenshot.bmp')
    expect(file.to_s).to eq(image_path)
  end

  it 'Check subimage of screenshot' do
    file = described_class.new('spec/bmp_image_examples/SE_screenshot.bmp')
    sub_image = file.get_sub_image(OnlyofficePdfParser::CursorPoint.new(86, 934), 23, 16)
    expect(sub_image).to be_nil
  end
end
