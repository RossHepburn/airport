require './lib/plane'

describe Plane do 
	
	let(:plane) { Plane.new }

	it "should be flying after we create it" do
		expect(plane).to be_flying
	end


	it "should be able to land" do
		expect(plane).to be_flying
		plane.land
		expect(plane).not_to be_flying
	end

	it "should be able to take off" do
		plane.land
		expect(plane).not_to be_flying
		plane.take_off
		expect(plane).to 	be_flying
	end
end
