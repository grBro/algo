ar = [2,4,6,3,5,1]

for j in 1..(ar.length - 1)
  key = ar[j]
  i = j - 1
  while i >= 0 and ar[i] > key
    ar[i+1] = ar[i]
    i = i - 1
  end

  ar[i+1] = key
end
p ar
