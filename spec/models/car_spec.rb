require 'rails_helper'

RSpec.describe Car, type: :model do

  before(:all) do
    FactoryGirl.create(:car, name: 'subaru_impreza', max_speed: 220)
    FactoryGirl.create(:car, name: 'subaru_impreza', max_speed: 240)
  end

  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:max_speed) }
end
