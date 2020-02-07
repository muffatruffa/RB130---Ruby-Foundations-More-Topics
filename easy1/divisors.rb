require 'benchmark'

def divisors(n)
   all_partitioned = (1..Math.sqrt(n)).inject([[],[]]) do |acc, divisor|
        if n % divisor == 0
            acc[0] << divisor
            acc[1].unshift(n / divisor) unless n / divisor == divisor
        end
        acc
    end
    all_partitioned[0] + all_partitioned[1]
end

def ls_divisors(number)
  1.upto(number).select do |candidate|
    number % candidate == 0
  end
end

p Benchmark.realtime() { divisors(99400891) } # 0.002662530998350121
p Benchmark.realtime() { ls_divisors(99400891) } # 6.745308525001747

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute

