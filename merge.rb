# attempt to create merge sort using low level techniques

def merge(ary)
  split_ary = [ary]
  for power in 1..(Math.log2(ary.first.size))
    for idx in 0..(split_ary.size - 1)
      split_ary[idx] = split(split_ary[idx])
    end
    split_ary.flatten!(1)
  end
  merge_ary = split_ary
  for power in 1..(Math.log2(ary.first.size))
    merge_ary = order(merge_ary, power)
  end
  return merge_ary[0]
end

def order(ary, iteration)
  new_ary = []
  for topIdx in 1..((ary.size * 2**(iteration - 1)) / 2**iteration)
    target_ary_size = 2**(iteration - 1)
    ary1_position = 0
    ary2_position = 0
    target_ary_idx1 = (topIdx - 1) * 2
    target_ary_idx2 = target_ary_idx1 + 1
    sub_ary = []
    for el in 1..(target_ary_size * 2)
      if ary1_position < target_ary_size
        if ary2_position < target_ary_size
          if ary[target_ary_idx1][ary1_position] <= ary[target_ary_idx2][ary2_position]
            sub_ary << ary[target_ary_idx1][ary1_position]
            ary1_position += 1
          else
            sub_ary << ary[target_ary_idx2][ary2_position]
            ary2_position += 1
          end
        else
          sub_ary << ary[target_ary_idx1][ary1_position]
          ary1_position += 1
        end
      elsif ary2_position <= target_ary_size
        sub_ary << ary[target_ary_idx2][ary2_position]
        ary2_position += 1
      end
    end
    new_ary << sub_ary
  end
  return new_ary
end

def split(ary)
  [ary.slice(0, ary.size / 2), ary.slice(ary.size / 2, ary.size / 2)]
end

test = [5,4,6,2,3,1,7,8]
p test
p merge(test)
