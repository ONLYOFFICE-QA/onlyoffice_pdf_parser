# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::BmpImage, '#get_sub_image_array' do
  it 'Find spell check pattern in big screenshot' do
    file = described_class.new('spec/bmp_image_examples/DE_screenshot.bmp')
    pattern = 'spec/bmp_image_examples/DE_spelling_underline.bmp'
    expect(file.get_sub_image_array(pattern).length).to eq(3)
  end

  it 'Find image rotary pattern in SE screenshot' do
    file = described_class.new('spec/bmp_image_examples/SEImageRotary.bmp')
    pattern = 'spec/bmp_image_examples/shape_rotary.bmp'
    expect(file.get_sub_image_array(pattern).length).to eq(1)
  end

  it 'Find image pattern_up_center pattern in pattern_up_center_full screenshot' do
    file = described_class.new('spec/bmp_image_examples/pattern_up_center_full.bmp')
    pattern = 'spec/bmp_image_examples/pattern_up_center.bmp'
    expect(file.get_sub_image_array(pattern).length).to eq(1)
  end
end
