require './lib/airport'
require './lib/plane'
require './lib/weather'

describe Airport do 
	
	let(:plane) { Plane.new }
	let(:airport) { Airport.new}

		it 'should initialize with the default capacity and no planes' do
			expect(airport.capacity).to eq(15)
			expect(airport.plane_count).to eq(0)
		end

	context 'landing and taking off' do

		before do
			# only applied in this context
			airport.stub(:weather_stormy?).and_return(false)
		end
		
		it 'a plane can land' do 
			expect(airport.plane_count).to eq(0)
			airport.land(plane)
			expect(airport.plane_count).to eq(1)
		end

		it 'a plane can take off' do
			expect(airport.plane_count).to eq(0)
			airport.land(plane)
			expect(airport.plane_count).to eq(1)
			airport.take_off(plane)
			expect(airport.plane_count).to eq(0)
		end	

		it 'a plane having landed should no longer be flying' do
			airport.land(plane)
			expect(plane).not_to be_flying
		end

		it 'a plane after takeing off should be flying' do
			airport.land(plane)
			airport.take_off(plane)
			expect(plane).to be_flying
		end

		it ' should not allow a plane to land if full' do 
			(airport.capacity).times { airport.land(Plane.new) }
			expect(airport).to be_full
			expect{ (airport.land(plane)) }.to raise_error(RuntimeError)
		end

		it 'should know if a plane has already taken off' do
			airport.land(plane)
			airport.take_off(plane)
			expect{ (airport.take_off(plane)) }.to raise_error(RuntimeError)
		end
	end

	context 'conditions involving weather' do 

		before do 
			# same as previous
		airport.stub(:weather_stormy?).and_return(true)
	end

		it 'should know if "stormy" or "sunny"' do
			expect(airport.weather_stormy?).to be_true
		end

		it 'should not allow plane to land when stormy' do
			expect{ (airport.land(plane)) }.to raise_error(RuntimeError)
		end

		it 'should not allow planes to take off when stormy' do
			expect{ (airport.take_off(plane)) }.to raise_error(RuntimeError)
		end
	end		
end