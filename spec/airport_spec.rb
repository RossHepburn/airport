require '../lib/airport'
require '../lib/plane'

describe Airport do 
	
	let(:plane) { Plane.new }
	let(:airport) { Airport.new}

	context 'taking off and landing' do
		
		it 'a plane can land' do 
			expect(airport.plane_count).to eq(0)
			airport.land(plane)
			expect(airport.plane_count).to eq(1)
		end	

		it 'a plane can take off' do
			airport.land(plane)
			airport.take_off(plane)
			expect(airport.plane_count).to eq(0)
		end
	end
end
