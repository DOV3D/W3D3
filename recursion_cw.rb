require "byebug"


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

# p sum_recursion([1,2,3,4])

def exp_1(base, n)
   return 1 if n == 0
#    return base if n == 1

   base * exp_1(base, n-1)
   

end

# p exp_1(2, 4)

def exp_2(base, n)
    return 1 if n == 0
    return base if n == 1

    odd_n = ((n-1)/ 2)
    odd_n_squared = odd_n * odd_n
    even_expo = exp_2(base, n/2)

    if n % 2 == 0
        even_expo * even_expo
    else
        base * exp_2(base, odd_n_squared) 
    end

end

# p exp_2(2, 4)
# p exp_2(2, 5)

def deep_dup(arr)
    arr.map do |ele|
        if ele.is_a?(Array)
            deep_dup(ele)
        else
            ele
        end
    end
end

# a = [[1,2,3],3,4,[[5,6]]]
# b = deep_dup(a)
# p b
# p b[0] << 7
# p b
# p a

def fib(n)
    return [] if n <= 0
    return [1] if n == 1
    return [1,1] if n == 2

    #fib(3) = [1,1,2] = fib(2) + [2]
    #fib(4) = [1,1,2,3] = fib(3) + [3]
    #fib(5) = [1,1,2,3,5] = fib(4) + [5]
    #fib(6) = [1,1,2,3,5,8] = fib(5) + [8]
    # fib(6) = [1,1,2,3,5,8] = fib(5) + [fib(5)[-1] + fib(5)[-2]]
    prev_fib = fib(n-1) 
    prev_fib + [prev_fib[-1] + prev_fib[-2]]
end

# p fib(6)

def bsearch(array, target) #[5, 9]
   
    mid = array.length / 2 #mid: 1
    return mid if target == array[mid] #target:5 array[2]: 4
    return nil if array.empty? #
  
    left_array = array[0...mid] #[1,3]
    right_array = array[mid+1..-1] #[5, 9]
   
    
     #target:5  array[2]: 4 

    if target < array[mid] #1 < 2
        bsearch(left_array, target) #[1, 2] target:1
    else
        bsearch(right_array, target)
    end


end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
p bsearch([1, 3, 4, 5, 9], 5) # => 3
p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

