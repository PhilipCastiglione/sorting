class Heap

  def initialize(ary)
    @ary = (ary)
    self.heapify
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

end

a = Heap.new([5,8,17,17,2,20,13,20,15,1,10,4])
puts a
# up to binary heap, now need to implement sort
