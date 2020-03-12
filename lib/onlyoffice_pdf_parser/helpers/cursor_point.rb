# frozen_string_literal: true

module OnlyofficePdfParser
  # Class for working with cursor coordinates
  class CursorPoint
    attr_accessor :left, :top

    def initialize(left, top)
      @left = left
      @top = top
    end

    alias width left
    alias height top
    alias x left
    alias y top

    def dup
      CursorPoint.new(@left, @top)
    end

    def to_s
      "[#{@left}, #{@top}]"
    end

    def ==(other)
      if other.respond_to?(:left) && other.respond_to?(:top)
        @left == other.left && @top == other.top
      else
        false
      end
    end

    def [](name)
      case name
      when :width
        left
      when :height
        top
      else
        'Unknown attribute'
      end
    end
  end

  Dimensions = CursorPoint
end
