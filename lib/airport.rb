class Airport

	attr_accessor :capacity
	attr_reader :planes	

	def initialize(capacity = 15)
		@capacity = capacity
		@planes = []
	end

	def plane_count
		planes.count
	end	

	def accept(plane,weather)
		raise "Unable to land due to bad weather....Good luck!" if !sunny?
		raise "Find another airport, we are full" if full?
		plane.land	
		@planes << plane
	end
	
	def release(plane,weather)
		raise "This plane has already taken off" if !@planes.include?(plane)
		plane.take_off
		@planes.delete(plane)

	end

	def full?
		plane_count == @capacity	
	end

end