require_relative 'plane'

DEFAULT_CAPACITY = 20

class Airport

	def planes
		@planes ||= []
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def plane_count
		planes.count 
	end

	def land(plane)
		raise "Airport is full" if full?	
		planes << plane
	end

	def take_off(plane)
		planes.delete(plane)
	end

	def full?
		plane_count == capacity
	end

end