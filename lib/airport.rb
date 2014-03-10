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

	def land(plane)
		raise "Unable to land due to bad weather....Good luck!" if weather_stormy?
		raise "Find another airport, we are full" if full?
		@planes << plane
		plane.land
	end
	
	def take_off(plane)
		raise "This plane has already taken off" if !@planes.include?(plane)
		@planes.delete(plane)
		plane.take_off
	end

	def full?
		plane_count == @capacity	
	end

end