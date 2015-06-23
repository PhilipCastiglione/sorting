# attempt to create selection sort using low level techniques

def selection(list)
  sorted_list = list
  # for each element
  for i in 0..(list.size - 1)
  	# for each unsorted index
    remainder = sorted_list[i..(list.size - 1)]
    # find the unsorted minimum
    local_min = remainder.min
    # remove it from the unsorted portion of the list
    sorted_list.delete_at(remainder.find_index(local_min) + i)
    # insert it at the index point
    sorted_list.insert(i, local_min)
  end
  return sorted_list
end

test = [5,2,1,1,2,3,4]
p test
p selection(test)
