# LRU 
####(least recently used eviction policy)

* The class should provides 2 public instance methods: put(key, value) and get(key). 
* Key and value can be arbitrary objects 
* Get will return nil if there is no such key in the cache.
* The maximum number of elements in the cache is configurable at instantiation time.

## Installation

Add this line to your application's Gemfile:

    gem 'lru'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lru

## Usage

@my_cache = Lru::Cache.new 10

#### example: caching multiples of 10

@my_cache.put 1, 10

@my_cache.put 3, 30

@my_cache.put 9, 90

@my_cache.get 3 	# 30

@my_cache.get 4		# nil

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
