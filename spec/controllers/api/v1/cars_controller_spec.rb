require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do


  describe 'GET show' do
    let!(:car) { create(:car, name: 'subaru_impreza', max_speed: 220)}
    context 'when action show hit and track found' do
      it 'respond with car detail json with max_speed_on_track' do
        get :show, id: car.slug, track: 'Baja'
        expect(JSON.parse(response.body)['car']['max_speed_on_track']).to match(/km/)
      end
    end

    context 'when action show hit and track not found' do
      it 'respond with car detail json with track not found ' do
        get :show, id: car.slug, track: 'random'
        expect(JSON.parse(response.body)['car']['max_speed_on_track']).to eq('Track Not Found')
      end
    end

    context 'when action show hit and track not passed' do
      it 'respond with car detail json with no track selected ' do
        get :show, id: car.slug
        expect(JSON.parse(response.body)['car']['max_speed_on_track']).to eq('Track Not Selected')
      end
    end

  end


end
