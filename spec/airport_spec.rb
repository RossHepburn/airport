require 'airport'
require 'plane'
require 'weather'

describe Airport do 
	
	let(:plane) { double :plane }
	let(:weather) { double :weather }
	let(:airport) { Airport.new }

		it 'should initialize with the default capacity and no planes' do
			expect(airport.capacity).to eq(15)
			expect(airport.plane_count).to eq(0)
		end

	context 'in good weather' do

		before do
			# only applied in this context
			airport.stub(:sunny?).and_return(true)
		end

		it "should be able to recieve a plane" do
			expect(plane).to receive(:land)
			airport.accept(plane,weather)
			expect(airport.plane_count).to eq(1)
		end

		it "should be able to release a plane" do
			expect(plane).to receive(:land)
			airport.accept(plane,weather)
			expect(plane).to receive(:take_off)
			airport.release(plane,weather)
			expect(airport.plane_count).to eq(0)
		end

		it 'should not allow a plane to land if full' do 
			(airport.capacity).times { airport.accept(Plane.new, weather) }
			expect(airport).to be_full
			expect{ (airport.accept(plane, weather)) }.to raise_error(RuntimeError)
		end

		it 'should know if a plane has already taken off' do
			expect(plane).to receive(:land)
			airport.accept(plane, weather)
			expect(plane).to receive(:take_off)
			airport.release(plane, weather)
			expect{ (airport.release(plane, weather)) }.to raise_error(RuntimeError)
		end
	end

	context "in bad weather" do 

		before(:each) do
			airport.stub(:sunny?).and_return(false)
		end

		it "should not be able to land" do
			expect { aiport.accept(plane, weather) }.to raise_error
			expect(airport.plane_count).to eq(0)
		end


		it 'should know if "stormy" or "sunny"' do
			expect(airport.sunny?).to be_false
		end

		it 'should not allow plane to land when stormy' do
			expect{ (airport.accept(plane, weather)) }.to raise_error(RuntimeError)
		end

		it 'should not allow planes to take off when stormy' do
			expect{ (airport.release(plane, weather)) }.to raise_error(RuntimeError)
		end	

	end
end