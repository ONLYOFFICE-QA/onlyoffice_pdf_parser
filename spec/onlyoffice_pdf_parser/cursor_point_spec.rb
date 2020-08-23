# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::CursorPoint do
  let(:cursor) { described_class.new(5, 10) }

  it '#dup is equal to itself' do
    expect(cursor.dup).to eq(cursor)
  end

  describe '#to_s' do
    it '#to_s include left coordinate' do
      expect(cursor.to_s).to include(cursor.left.to_s)
    end

    it '#to_s include top coordinate' do
      expect(cursor.to_s).to include(cursor.top.to_s)
    end
  end

  describe '#[]' do
    it 'Cursor[:width] return correct value' do
      expect(cursor[:width]).to eq(5)
    end

    it 'Cursor[:height] return correct value' do
      expect(cursor[:height]).to eq(10)
    end

    it 'Cursor[:foo] return Unknown attribute' do
      expect(cursor[:foo]).to eq('Unknown attribute')
    end
  end
end
