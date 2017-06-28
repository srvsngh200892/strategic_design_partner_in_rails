class CarInfo
  attr_reader :car_slug, :max_speed, :track

  def initialize(params)
    @car_slug ||= params[:id]
    @track ||= params[:track]
  end

  def details
    begin
      car = Car.friendly.find(car_slug)
      @max_speed = car.max_speed
      get_json_response(car)
    rescue => error
       {car: { staus: 'Car Not Found'} }
    end

  end

  private

  def get_json_response(car)
    car_info = {}
    max_speed_on_track = stringyfy_speed(track_max_speed)
    car_max_speed = stringyfy_speed(max_speed)
    car_obj = JSON.parse(car.to_json)
    car_obj.merge!('max_speed_on_track'=> max_speed_on_track)
    car_obj.merge!('max_speed'=> car_max_speed)
    car_info['car'] = car_obj
    car_info
  end


  def track_max_speed
   begin
      if track.present?
        #get track object on run time based on params"
        track_factor = "Tracks::#{track.titleize.gsub(' ', '')}".constantize.new.track_slowness_factor(self)
        (max_speed - track_factor.to_f*max_speed/100)
      else
        'Track Not Selected'
      end
    rescue => error
       'Track Not Found'
    end
  end

  def stringyfy_speed(speed)
    speed.is_a?(String) ? speed : "#{speed.to_s}km/h"
  end

end
