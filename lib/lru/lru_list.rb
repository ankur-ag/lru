module Lru
	class LruList
		# represents each node in a LRU doubly linked list
		class Node
			attr_reader :key
			attr_accessor :value, :next_node, :prev_node 

			def initialize key, val, prev_node = nil, next_node = nil
				@key = key
				@value = val
				@prev_node = prev_node
				@next_node = next_node
			end
		end

		# construct and empty doubly linked list with a head and a tail
		def initialize
			@head = Node.new nil, nil
			@tail = Node.new nil, nil, @head
			@head.next_node = @tail
		end

		# add a new node to the head of the list
		def add_to_first key, val
			@head.next_node = Node.new key, val, @head, @head.next_node
			@head.next_node.next_node.prev_node = @head.next_node
			return @head.next_node
		end

		# take the given node and make it the first node in the list
		def promote_node node
			# unless it's already the first node, make it the first
			unless node.prev_node == @head
				node.prev_node.next_node = node.next_node
				node.next_node.prev_node = node.prev_node
				node.next_node = @head.next_node
				node.prev_node = @head
				@head.next_node.prev_node = node
				@head.next_node = node
			end
			return self
		end

		# delete the last node and return the key
		def remove_last
			unless @head.next_node == @tail
				to_be_removed = @tail.prev_node
				@tail.prev_node = @tail.prev_node.prev_node
				@tail.prev_node.next_node = @tail
				return to_be_removed.key
			end
		end

		# show the content of the cache
		def show
			head = @head.next_node
			while head.next_node != nil
				puts "{#{head.key}, #{head.value}}"
				head = head.next_node
			end
		end
	end
end