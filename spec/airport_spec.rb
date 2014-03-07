require '../lib/airport'
require '../lib/plane'

describe Airport do 
	
	let(:plane) { Plane.new }
	let(:airport) { Airport.new}

	def fill_airport(airport)
		airport.capacity.times { airport.land(Plane.new) }
	end	

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


	context 'traffic control' do
    
    it 'should know when it is full' do
    	expect(airport).not_to be_full
    	fill_airport airport
    	expect(airport).to be_full
    end

    it 'a plane cannot land if the airport is full' do
    	fill_airport airport
    	expect{ airport.land(plane)}.to raise_error(RuntimeError)
		end
  end

end

