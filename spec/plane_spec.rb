require 'plane'

describe Plane do 

	let(:plane) { Plane.new }

	 it "should be flying after being created" do 
	 	expect(plane).to be_flying
	end

	it "should be grounded after landing " do
		plane.land
		expect(plane).not_to be_flying
	end

	it "should be flying after take off" do
		plane.land
		plane.take_off
		expect(plane).to be_flying
	end

	it "should be grounded if it's not flying" do 
		plane.land
		expect(plane).to be_grounded
		expect(plane).not_to be_flying
	end
	
	it "should be flying if it's not grounded" do 
		expect(plane).not_to be_grounded
		expect(plane).to be_flying
	end

end
