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

    # Make a copy of object
    # @return [CursorPoint] another object
    def dup
      CursorPoint.new(@left, @top)
    end

    # @return [String] convert object to string
    def to_s
      "[#{@left}, #{@top}]"
    end

    # Compare object with other
    # @param other [Object] object to compare
    # @return [True, False] result of comparison
    def ==(other)
      if other.respond_to?(:left) && other.respond_to?(:top)
        @left == other.left && @top == other.top
      else
        false
      end
    end

    # Accessor of attributes like hash
    # @param name [Symbol] attribute name
    # @return [Object] value of attribute
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

  # Alias for this object
  Dimensions = CursorPoint
end
