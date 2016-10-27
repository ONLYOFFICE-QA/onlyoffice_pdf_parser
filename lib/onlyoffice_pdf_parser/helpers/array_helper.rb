module OnlyofficePdfParser
  # Methods to help working with array
  class ArrayHelper
    # Get list of indexes in which one array is included to another
    # @param array [Array] big array
    # @param included_array [Array] array to search
    # @return [Array, Integer] indexes
    def self.get_array_inclusion_indexes(array,
                                         included_array)
      index_array = []
      first_element = included_array.first
      array.each_with_index do |array_element, array_element_index|
        if array_element == first_element
          array_part = array.slice(array_element_index, included_array.length)
          index_array << array_element_index if array_part == included_array
        end
      end
      index_array
    end
  end
end
