require 'weather'

describe Weather do

	let(:weather) {Weather.new}

	it "is sunny 80% of the time" do 
		weather_readings = Array.new(10000) { weather.sunny? }
		times_when_sunny = weather_readings.count { |reading| reading == true}
		expect(times_when_sunny).to be_within(500).of(8000)
	end
end