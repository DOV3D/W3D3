def range(first_num, last_num)
    # if end < start return []
    return [] if last_num < first_num || last_num == first_num
    # return [first_num] if last_num == first_num
    
    #return [start...end]
    range(first_num, last_num - 1) + [last_num - 1]
end

# p range(1, 1)
# p range(2, 5)

def sum_iter(arr)
    sum = 0
    arr.each { |num| sum += num }
    sum
end

# p sum_iter([1,2,3,4])

def sum_recursion(arr)
    return nil if arr.empty?
    return arr[0] if arr.length == 1

    arr[0] + sum_recursion(arr[1..-1])
end

p sum_recursion([1,2,3,4])

