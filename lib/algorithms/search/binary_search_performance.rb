require "benchmark" 
require_relative 'binary_search_recursive'
require_relative 'binary_search'

# ------------------------------------------------
# Check the performance of the loop implementation
# versus the recursive implementation. The recursive
# is a little slower but it's not as dramatic as I 
# thought it would be: 1.6sec vs 1.4sec

n = 1000000
data = (1..100).to_a
bsr = BinarySearchRecursive.new(data)
bs = BinarySearch.new(data)
Benchmark.bmbm {|x| 
  x.report("recursive") { n.times { bsr.search_for(5)} }
  x.report("non-recursive") { n.times { bs.search_for(5) } } 
} 

#                     user     system      total        real
# recursive       1.620000   0.000000   1.620000 (  1.615217)
# non-recursive   1.400000   0.000000   1.400000 (  1.400991)

