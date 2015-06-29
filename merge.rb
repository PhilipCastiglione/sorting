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
  merge_ary = split_ary
  for i in 1..1 #change this to the correct #
    merge_ary = order(merge_ary, i)
  end
end

def order(ary, iteration)
  new_ary = []
  for i in 0..(ary.size / 2**iteration - 1)
    sub_ary = []
    list1 = ary[2 * i]
    idx1 = 0
    list2 = ary[2* i + 1]
    idx2 = 0
    
    def compare
      # if list 1 is empty go within list 2
      # if list 2 is empty go within list 1
      # this for both lists are not empty
      if list1[idx1] > list2[idx2]
        #push list2idx2 into sub list
        sub_ary << list2[idx2]
        idx2 += 1
      else
        sub_ary << list1[idx1]
        idx1 += 1
      end
      # if there's only one left, use that
      # otherwise, recurse
    end

  end
  
end

def split(ary)
  [ary.slice(0, ary.size / 2), ary.slice(ary.size / 2, ary.size / 2)]
end

p merge([5,4,6,2,3,1,7,8])

# goddamn refactor