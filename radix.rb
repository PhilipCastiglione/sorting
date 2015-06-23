# attempt to create radix (multi-digit) sort using low level techniques

def radix(list)
  remainder = list
  result = []
  for digit in 1..list.max.to_s.size
    # sort remainder list by radix digit
    sorted_list = []
    for n in 0..9
      for idx in 0..(remainder.size - 1)
        sorted_list << remainder[idx] if remainder[idx].to_s[-digit].to_i == n
      end
    end
    remainder = sorted_list
    # on sorted remainder list, shunt elements of size == radix digit to result
    used = []
    for idx in 0..(remainder.size - 1)
      if remainder[idx].to_s.size == digit
        result << remainder[idx]
        used << idx
      end
    end
    # then remove them from the remainder list
    for idx in 0..(used.size - 1)
      remainder.delete_at(used[idx])
    end
  end
  return result
end

test = [493,812,715,710,195,36,1000,437,582,340,385]
p test
p radix(test)
