require 'pry'
class Sorter < Struct.new(:list)

  def simple(index = 0)
    shorter_list = list[index..list.size]
    min = shorter_list.min

    list.delete(min)
    list.insert(index, min)

    shorter_list.size == 1 ? list : simple(index + 1)
  end

  def shift_sort(arr = [])
    min = list.min
    list.delete(min)
    return arr << min if list.empty?
    [min] + shift_sort(list)
  end

  def bubble_sort(arr = [])
    list.each_with_index do |x, i|
      list[i], list[i + 1] = list[i + 1], list[i] if i < list.size - 1 && list[i] > list[i + 1]
    end
    last = list.delete(list.last)
    return [last] if list.empty?
    bubble_sort(list) + [last]
  end
  
  def merge_sort(arr = [], elements = 1) 
    #Prepare the array for sorting in the first iteration
    arr = list.each_slice(1).to_a if elements == 1 
    return_array = []
    finished = false
    arr.each_with_index do |sub_array, index|
      if index%2 == 0 || index == arr.length-1 && !finished 
        if index == arr.length-1 
          temp_array = []
          while sub_array.length > 0
            temp_array << sub_array.min
            sub_array.delete_at(sub_array.index(sub_array.min))
          end
          return_array << temp_array if temp_array.length>0
          finished = true
        else
          compare_array = arr[index+1]
          storage_sort = []
          until compare_array.length == 0 && sub_array.length == 0 do
            compare_array[0] < sub_array[0] ? (storage_sort << compare_array.shift) : (storage_sort << sub_array.shift)
            if compare_array.length == 0 
              storage_sort << sub_array.shift while sub_array.length > 0
            elsif sub_array.length == 0 
              storage_sort << compare_array.shift while compare_array.length > 0
            end
          end
          return_array << storage_sort
        end
      end 
        finished = true if index == arr.length-2 
    end
      return_array.length == 1 ? (return return_array[0]) : (merge_sort(return_array, elements = 2))
  end 
  
end




