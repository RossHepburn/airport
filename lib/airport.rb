require_relative 'plane'

class Airport

	def planes
		@planes ||= []
	end

	def plane_count
		planes.count 
	end

	def land(plane)
		planes << plane
	end

	def take_off(plane)
		planes.delete(plane)
	end
end