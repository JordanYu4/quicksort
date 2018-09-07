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
  end

  def self.partition(array, start, length, &prc)
  end
end
