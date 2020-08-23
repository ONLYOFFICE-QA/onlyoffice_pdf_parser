# frozen_string_literal: true

require 'spec_helper'

describe OnlyofficePdfParser::CursorPoint, '#==' do
  let(:cursor) { described_class.new(5, 10) }

  it 'Cursor is equal itself' do
    expect(cursor).to eq(cursor)
  end

  it 'Cursor is not equal another' do
    expect(cursor).not_to eq(described_class.new(6, 10))
  end

  it 'Cursor is not equal to another object' do
    expect(cursor).not_to eq(Object.new)
  end
end
