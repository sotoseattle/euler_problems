require 'benchmark'

super_array = File.open('./p067_triangle.txt', 'r')
                  .readlines
                  .map { |l| l.strip.chomp.split(' ').map(&:to_i) }

p Benchmark.realtime {
  a, pepe = 0, [0]*super_array.last.size
  super_array.reverse.each do |sub_arr|
    a = sub_arr.zip(pepe).map{|x| x.reduce(:+) }
    pepe = a.each_cons(2).map(&:max)
  end
  p a
}
