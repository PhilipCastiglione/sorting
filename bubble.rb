# attempt to create bubble sort using low level techniques

def bubble(list)
  sorted_list = list
  # for each element
  for i in 0..(list.size - 1)
    for i2 in 1..(list.size - i - 1)
      # swap each higher adjacent value to the right until you can't
      if sorted_list[i2] < sorted_list[i2 - 1]
        value_transfer = sorted_list[i2]
        sorted_list[i2] = sorted_list[i2 - 1]
        sorted_list[i2 - 1] = value_transfer
      end
    end
  end
  return sorted_list
end

test = [5,2,1,1,2,3,4]
p test
p bubble(test)


# modified bubble sort - early exit when array is sorted

def bubbleMod(list)
  sorted_list = list
  # for each element
  for i in 0..(list.size - 1)
    changed = false
    for i2 in 1..(list.size - i - 1)
      # swap each higher adjacent value to the right until you can't
      if sorted_list[i2] < sorted_list[i2 - 1]
        value_transfer = sorted_list[i2]
        sorted_list[i2] = sorted_list[i2 - 1]
        sorted_list[i2 - 1] = value_transfer
        changed = true
      end
    end
    return sorted_list if !changed
  end
  return sorted_list
end

test = [5,2,1,1,2,3,4]
p test
p bubbleMod(test)
