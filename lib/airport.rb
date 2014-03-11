class Airport

	attr_accessor :capacity
	attr_reader :planes	

	def initialize(weather, capacity = 15)
		@capacity = capacity
		@planes = []
		@weather = weather
	end

	def plane_count
		planes.count
	end	

	def accept(plane)
		raise "Unable to land due to bad weather....Good luck!" if !@weather.sunny?
		raise "Find another airport, we are full" if full?
		plane.land	
		@planes << plane
	end
	
	def release(plane)
		raise "This plane has already taken off" if !@planes.include?(plane)
		plane.take_off
		@planes.delete(plane)
	end

	def full?
		plane_count == @capacity	
	end

end