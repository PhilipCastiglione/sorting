# attempt to create insertion sort using low level techniques

def insertion(list)
  # beginning with the first element
  sorted_list = [list[0]]
  # check each following list item
  for i in 1..(list.size - 1)
    # against each sorted list item
    for i2 in 0..(sorted_list.size - 1)
      # if lower than the first, unshift in
      if list[i] < sorted_list[0]
        sorted_list.unshift(list[i])
      # if greater than the sorted list item and lower than the next one
      # or if at the end, insert it in
      elsif list[i] > sorted_list[i2] &&
         list[i] <= (sorted_list[i2 + 1] || list[i])
         sorted_list.insert(i2 + 1, list[i])
      end
    end
  end
  return sorted_list
end

test = [3,5,7,2,8,1,9,0,4,6]
p test
p insertion(test)
