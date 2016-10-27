# encoding: utf-8
require 'image_size'
require 'rmagick'
require_relative 'helpers/array_helper'
require_relative 'helpers/cursor_point'
include Magick

module OnlyofficePdfParser
  # class for storing bmp image pixels data
  class BmpImage
    attr_accessor :path_to_image, :pixels, :width, :height

    def initialize(path_to_image = nil)
      return if path_to_image.nil?
      @path_to_image = path_to_image
      image_size = ImageSize.new(File.open(path_to_image).read).size

      @width = image_size.first
      @height = image_size.last
      @pixels = ImageList.new(path_to_image).get_pixels(0, 0, @width, @height).each_slice(width).to_a
    end

    def to_s
      @path_to_image
    end

    def ==(other)
      return false unless other.width == @width && other.height == @height
      @pixels.each_with_index do |row, row_index|
        row.each_with_index do |pixel, pixel_index|
          other_pixel = other.pixels[row_index][pixel_index]
          result = (pixel == other_pixel)
          return false unless result
        end
      end
      true
    end

    def get_sub_image(start_point = CursorPoint.new(0, 0), width = 0, height = 0)
      sub_image = BmpImage.new
      pixels_array = []
      height.times do |current_height|
        line_array = []
        width.times do |current_width|
          # If pixels match to near to the edge of right border of image, then end
          return nil if @pixels[start_point.top + current_height].nil?
          line_array << @pixels[start_point.top + current_height][start_point.left + current_width]
        end
        pixels_array << line_array
      end
      sub_image.pixels = pixels_array
      sub_image.width = width
      sub_image.height = height
      sub_image
    end

    def get_sub_image_array(path_to_sub_image)
      coordinates_array = []
      sub_image = BmpImage.new(path_to_sub_image)
      first_sub_image_line = sub_image.pixels.first
      @pixels.each_with_index do |current_line, image_line_index|
        included_indexes = ArrayHelper.get_array_inclusion_indexes(current_line, first_sub_image_line)
        included_indexes.each do |current_included_index|
          coordinates = CursorPoint.new(current_included_index % width, image_line_index)
          got_sub_image = get_sub_image(coordinates, sub_image.width, sub_image.height)
          coordinates_array << coordinates if got_sub_image == sub_image
        end
      end
      coordinates_array
    end

    def get_sub_image_center_array(path_to_sub_image)
      sub_image = BmpImage.new(path_to_sub_image)
      coordinates_array = get_sub_image_array(path_to_sub_image)
      coordinates_array.map do |current_coordinate|
        CursorPoint.new(current_coordinate.left - sub_image.width / 2, current_coordinate.top - sub_image.height / 2)
      end
    end
  end
end
