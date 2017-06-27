require 'rails_helper'

RSpec.describe CarInfo, type: :service do

  let(:params) { Hash.new }

  subject(:car_info) { CarInfo.new(params) }

  describe '#detail' do
    let!(:car) { create(:car, name: 'subaru_impreza', max_speed: 220)}
    context 'when search params contain valid track params' do
      let(:params) do
        {
          track: 'baja',
          id: car.slug,
        }
      end

      it { expect(car_info.details).not_to be_empty }

      it 'respond with car detail json with max_speed_on_track' do
        expect(car_info.details['max_speed_on_track']).to match(/km/)
      end
    end

    context 'when search params doesn\'t contain valid track params' do
      let(:params) do
        {
          track: 'not_valid_track',
          id: car.slug,
        }
      end

      it 'respond with car detail json with track not found' do
       expect(car_info.details['max_speed_on_track']).to eq('Track Not Found')
      end
    end

    context 'when search params doesn\'t contain track ' do
      let(:params) do
        {
          id: car.slug
        }
      end

      it 'respond with car detail json with track not selected' do
        expect(car_info.details['max_speed_on_track']).to eq('Track Not Selected')
      end
    end
  end
end
