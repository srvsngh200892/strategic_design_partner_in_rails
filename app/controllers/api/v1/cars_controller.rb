class Api::V1::CarsController < Api::V1::BaseController

  def show
    @car_info = CarInfo.new(params).details
    render :json => @car_info, status: :ok
  end

end
