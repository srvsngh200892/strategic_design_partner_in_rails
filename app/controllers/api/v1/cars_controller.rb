class Api::V1::CarsController < Api::V1::ApiController

  def index
    @car_info = CarInfo.new(params)
  end

end
