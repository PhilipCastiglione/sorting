# attempt to create merge sort using low level techniques

def merge(ary)
  split_ary = [ary]
  for p in 1..(Math.log2(ary.first.size))
    for i in 0..(split_ary.size - 1)
      split_ary[i] = split(split_ary[i])
    end
    split_ary.flatten!(1)
  end
  # return split_ary
  merge_ary = order(split_ary, 1)

end

def order(ary, iteration)
  new_ary = []
  for i in 0..(ary.size / 2**iteration - 1)
    list1 = ary[2 * i]
    idx1 = 0
    list2 = ary[2* i + 1]
    idx2 = 0
    if list1[idx1] > list2[idx2]
      #push list2idx2 into sub list

    else

    end
  end
  
end

def split(ary)
  [ary.slice(0, ary.size / 2), ary.slice(ary.size / 2, ary.size / 2)]
end

p merge([5,4,6,2,3,1,7,8])
