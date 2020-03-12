# frozen_string_literal: true

require 'spec_helper'

describe 'Check array custom functions' do
  it 'get_array_inclusion_indexes one entry' do
    first_array = [1, 2, 3, 4, 5]
    second_array = [2, 3]
    expect(OnlyofficePdfParser::ArrayHelper.get_array_inclusion_indexes(first_array, second_array)).to eq([1])
  end

  it 'get_array_inclusion_indexes several entry' do
    first_array = [1, 2, 3, 4, 5, 2, 3, 6]
    second_array = [2, 3]
    expect(OnlyofficePdfParser::ArrayHelper.get_array_inclusion_indexes(first_array, second_array)).to eq([1, 5])
  end
end
