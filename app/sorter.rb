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
      if elements == 1 
        arr = list
        arr = arr.each_slice(1).to_a
      end


      #Save the results of the iteration in this array
      return_array = []
      
      #define the helper_method
      
      
      finished = false
      #iterate of the general array, beginning of the actual algorithm
      arr.each_with_index do |sub_array, index|
        
        if index%2 == 0 || index == arr.length-1 && !finished #Skip an element
          
          #escape the loop if iteration should have finished, otherwise the last one will be executed twice
          temp_array = []
          
          if index == arr.length-1 

            
            while sub_array.length > 0
              temp_array.push(sub_array.min)
              sub_array.delete_at(sub_array.index(sub_array.min))
              
            end
           
            if temp_array.length>0
              return_array.push(temp_array)
            end
            
            finished = true
          else
            #Create an array element to check with 
            compare_array = arr[index+1]
            storage_sort = []

            iteration = 0

            return_array.push(sort_two_elements(compare_array, sub_array, storage_sort, iteration))
          end
        end #End of first if statement
        
        if index == arr.length-2 
            finished =true
        end

      
      end #End of the iteration over the whole array

      #Stopping condition
      if return_array.length == 1
        return return_array[0]
      else
        merge_sort(return_array, elements = 2)
      end
  end

  def sort_two_elements(array1, array2, storage_sort, iteration)

            
            if array1[0]<array2[0]
              storage_sort.push(array1.shift)
            else
              storage_sort.push(array2.shift)
            end
            #check if one of the arrays is empty
            if array1.length == 0 
              array2.each do |item|
                storage_sort.push(item)
              end
              array2 = []
            elsif array2.length == 0 
              array1.each do |item|
                storage_sort.push(item)
              end
              array1 = []
            end
            
            if array1.length == 0 && array2.length == 0

              return storage_sort 
            else
              sort_two_elements(array1, array2, storage_sort, iteration + 1)
            end

           
      end
end




