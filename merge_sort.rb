def merge_sort(ary)
  if ary.length > 1
    p = 0
    q = ary.length - 1
    middle = (ary.length - 1) / 2

    left_half = ary[p..middle]
    right_half = ary[middle+1..q]

    merge_sort(left_half)
    merge_sort(right_half)

    i = 0
    j = 0
    k = 0

    while i < left_half.length && j < right_half.length do
      if left_half[i] < right_half[j]
        ary[k] = left_half[i]
        i = i + 1
      else
        ary[k] = right_half[j]
        j = j + 1
      end

      k = k + 1
    end

    while i < left_half.length do
      ary[k] = left_half[i]
      i = i + 1
      k = k + 1
    end

    while j < right_half.length do
      ary[k] = right_half[j]
      j = j + 1
      k = k + 1
    end
  end
end

ary = [42,45,10,1,66,84,17,75,12]
merge_sort(ary)
p ary
