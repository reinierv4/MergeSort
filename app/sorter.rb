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
end
