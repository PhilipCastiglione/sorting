# attempt to create bubble sort using low level techniques

def bubble(list)
  sorted_list = list
  for i in 0..(list.size - 1)
    for i2 in 1..(list.size - i - 1)
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
