require "lru/version"

module Lru
	class Cache

		attr_reader :my_hash, :max_size

		def initialize max_size = 0
			@my_hash = Hash.new
			@max_size = max_size
			@my_list = LruList.new
		end

		# get the value for a given key from the cache, if not found, return nil
		def get key
			if @my_hash.has_key? key
				node = @my_hash[key]
				@my_list.promote_node node
				node.value
			else
				nil
			end
		end

		# store a key value pair into the cache
		# if the key already exists, update its value
		def put key, value
			# if the key already exists, 
			if @my_hash.has_key? key
				@my_hash[key].value = value
			else
				# if the list is full, remove the last node to create one spot for a new one
				if @my_hash.length == @max_size
					deleted_key = @my_list.remove_last
					@my_hash.delete deleted_key
				end
				# create a new node in the list
				# store this node in the hash
				if @my_hash.length < @max_size
					@my_hash[key] = @my_list.add_to_first key, value
				end
			end
			return @my_hash
		end

		# show the content of the list
		def show_list
			@my_list.show
		end
	end
end
