EULER PROBLEMS - SEATTLE.RB
===========================

Problem 8
---------

A great example of how to use each_cons from Enumerable.

```ruby
huge.to_s.chars.map(&:to_i).each_cons(n_adj) do |chosen_numbers|
  ...
end
```

Problem 9
----------

There has to be a smarter way that leverages ruby!

Problem 10
----------

Prime class mixes well with enumerable stuff

```ruby
Prime.each(n).reduce(:+)
```

Problem 11
----------

NArray, anybody?

Problem 12
----------

The key is to realize what we need exactly, which is all the possible factors of a number, not only the prime factors, but all their uniq combinations.

Problem 13
----------

NArray helps to add by columns, from left to right, so we end up with 50 sums.

Problem 14
----------

```ruby
def collatz_chain_size(n)
  count = 1
  while n != 1
    n = (n % 2 == 0) ? n/2 : (3 * n) + 1
    count += 1
  end
  count
end
```
