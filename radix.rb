# attempt to create radix sort using low level techniques

def radix(list)
  sorted_list = list
  for exp in 1..list.max.to_s.size
    radix_ary = []
    puts exp
    for digit in 0..9
      for i in 0..(list.size - 1)
        if sorted_list[i].to_s.size  <  exp
          radix_ary << sorted_list[i]
        end
      end
    end
    p radix_ary
    for digit in 0..9
      for i in 0..(list.size - 1)
        if sorted_list[i].to_s[-exp] == digit.to_s &&
           sorted_list[i].to_s.size  >=  exp
          radix_ary << sorted_list[i]
        end
      end
    end
    p radix_ary
    sorted_list = radix_ary
  end
  return sorted_list
end

test = [493,812,715,710,195,36,1000,437,582,340,385]
# test = [493,812,715,710,195,437,582,340,385]
p test
p radix(test)
