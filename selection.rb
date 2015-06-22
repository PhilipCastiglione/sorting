# attempt to create selection sort using low level techniques

def selection(list)
  sorted_list = list
  for i in 0..(list.size - 1)
    remainder = sorted_list[i..(list.size - 1)]
    local_min = remainder.min
    sorted_list.delete_at(remainder.find_index(local_min) + i)
    sorted_list.insert(i, local_min)
  end
  return sorted_list
end

test = [5,2,1,1,2,3,4]
p test
p selection(test)
