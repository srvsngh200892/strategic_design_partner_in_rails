require 'rails_helper'

RSpec.describe Tracks::Nurburgring, type: :service do


  subject(:track) { Tracks::Nurburgring.new }

  describe '#track_slowness_factor' do
    it 'respond with car factor between 0 to 35' do
      expect(track.track_slowness_factor).to be_between(0, 35)
    end

  end
end
