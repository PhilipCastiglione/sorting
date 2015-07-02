class Heap
  attr_accessor :ary

  def initialize(ary)
    @ary = (ary)
    self.heapify
  end

  # swaps position of nodes
  def swap(idx1, idx2)
    @ary[idx1] += @ary[idx2]
    @ary[idx2] = @ary[idx1] - @ary[idx2]
    @ary[idx1] -= @ary[idx2]
  end

  # returns parent index, or if root node, returns nil
  def getParentIdx(idx)
    (idx-1)/2.0.floor if (idx > 0)
  end

  # returns ary with potential child indices
  def getChildrenIdx(idx)
    [2 * idx + 1, 2 * idx + 2]
  end

  # upheap a node as far as possible
  def upheap(idx)
    parentIdx = getParentIdx(idx) # gets index of parent node or nil
    # swap where parent is larger then recurse
    if parentIdx && @ary[parentIdx||idx] > @ary[idx]
      swap(idx, parentIdx)
      upheap(parentIdx)
    end
  end

  # downheap a node as far as possible
  def downheap(idx)
    childrenIdx = getChildrenIdx(idx) # gets array of potential child indices
    nodes = [@ary[idx], @ary[childrenIdx[0]], @ary[childrenIdx[1]]]
    # swap where child is smallest then recurse 
    if @ary[childrenIdx[0]] == nodes.compact.min # compact removes nil where no child
      swap(idx, childrenIdx[0])
      downheap(childrenIdx[0])
    elsif @ary[childrenIdx[1]] == nodes.compact.min # compact removes nil where no child
      swap(idx, childrenIdx[1])
      downheap(childrenIdx[1])
    end
  end

  # convert initial array to binary heap
  def heapify
    for i in (0..(@ary.size-1)).to_a.reverse
      upheap(i)
      downheap(i)
    end
  end

  # remove smallest accessible element one at a time
  def sort(sorted_ary=[],target_indices=[0], consumed_indices=[])

    def getAccessibleMin(target_indices, consumed_indices)
      target_vals = []
      for i in 0..(target_indices.size-1)
        target_vals << @ary[target_indices[i]]
      end
      a = nil
      for i in 0..(@ary.size-1)
        if @ary[i] == target_vals.compact.min &&
           !consumed_indices.include?(i) &&
           !a
          a = i
        end
      end
      return a
    end

    def addToSortedAry(sorted_ary, index)
      return sorted_ary << @ary[index]
    end

    def addToTargetIndices(target_indices, index)
      children = getChildrenIdx(index)
      for i in 0..(children.size-1)
        target_indices << children[i] if @ary[children[i]]
      end
      return target_indices
    end

    localMinIdx = getAccessibleMin(target_indices, consumed_indices)
    sorted_ary = addToSortedAry(sorted_ary, localMinIdx)

    consumed_indices << localMinIdx
    unless @ary.size == consumed_indices.size
      target_indices.delete(localMinIdx)
      target_indices = addToTargetIndices(target_indices, localMinIdx)
      sort(sorted_ary, target_indices, consumed_indices)
    end

    return sorted_ary
  end

  # pretty(ish) print
  def to_s
    lines = Math.log2(@ary.size).floor
    puts " "*2*(2**lines - 1) + "(#{@ary[0]})"
    for i in 1..lines
      nodes = ""
      spacer = " "*2*((2**lines) - (2**i))
      for i2 in (2**(i) - 1)..(2**(i + 1) - 2)
        nodes += "(#{@ary[i2]}) "
      end
      puts spacer + nodes
    end
  end

end
test = [5,8,17,17,2,20,13,20,15,1,10,4]
p test
p Heap.new(test).sort
