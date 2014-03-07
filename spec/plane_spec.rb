require '../lib/plane'

describe Plane do 
	
	let(:plane) { Plane.new }

	it "should not be grounded after we create it" do
		expect(plane).not_to be_grounded
	end

	it "should be able to fly" do
	expect(plane).not_to be_grounded
	end

	it "should be able to land" do
	plane.land
	expect(plane).to be_grounded
	end
end
