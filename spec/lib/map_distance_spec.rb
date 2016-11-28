require 'spec_helper'
require 'map_distance'

describe MapPoint do
  describe 'map_point ' do
    let(:subject) { MapPoint.new(41.8985,-91.03852) }
    let(:subject1) { MapPoint.new(40.8947,-89.0434) }
    it 'should return distance bw two positions(for this input distance approximately 200 )' do
      expect(subject1.distance(subject)).to eq(200.438)
    end
  end

end
