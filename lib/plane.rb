class Plane
	
	def initialize
		@flying
	end

	def grounded?
		@grounded
	end

	def land
		@grounded = true
	end

	def flying
		@grounded = false
		
	end
	

end