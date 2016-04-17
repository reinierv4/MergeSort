class Sorter < Struct.new(:list)

  def simple(index = 0)
    first = @list[index]
    second = @list[index + 1]
    first_index = @list.index(first)
    second_index = @list.index(second)

    if first > second
      @list[second_index] = first
      @list[first_index] = second
      sort(@list, index + 1)
    else

    end
  end
end