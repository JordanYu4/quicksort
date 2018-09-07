class QuickSort
  # Quick sort has average case time complexity O(nlogn), but worst
  # case O(n**2).

  # Not in-place. Uses O(n) memory.
  def self.sort1(array)
    return array if array.length <= 1
    left, right, mid = [], [], []
    pivot = array[rand(array.length)]
    array.each do |el|
      case el <=> pivot 
      when -1
        left << el 
      when 0
        mid << el 
      else 
        right << el
      end
    end
    QuickSort.sort1(left) + mid + QuickSort.sort1(right)
  end

  # In-place.
  def self.sort2!(array, start = 0, length = array.length, &prc)
    return array if length < 1
    part_idx = QuickSort.partition(array, start, length, &prc)
    QuickSort.sort2!(array, start, part_idx - start, &prc)
    QuickSort.sort2!(array, part_idx + 1, length - part_idx - 1, &prc)
  end
  
  def self.partition(array, start, length, &prc)
    prc ||= Proc.new {|el, pivot| el <=> pivot}
    
    pivot = array[start]
    part_idx = start
    (start + 1).upto(start + length - 1) do |idx|
      if prc.call(array[idx], pivot) <= 0
        array[idx], array[part_idx + 1] = array[part_idx + 1], array[idx]
        part_idx += 1
      end
    end
    array[start], array[part_idx] = array[part_idx], array[start]
    return part_idx
  end
end
