class Array
  def get_array_inclusion_indexes(included_array)
    index_array = []
    first_element = included_array.first
    each_with_index do |array_element, array_element_index|
      if array_element == first_element
        array_part = slice(array_element_index, included_array.length)
        index_array << array_element_index if array_part == included_array
      end
    end
    index_array
  end
end
