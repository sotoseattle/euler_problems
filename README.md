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
