class Tracks::Nurburgring < Tracks::TrackDetail

  # Its a child track class, add functionality only related to this track
  def max_speed_factor(context=nil)
    compute_factor
  end

  # add other condition factors like :
  # track,
  # time of the year ( season )
  # time of the day ( taken automaticaly )
  # etc.

  private

  def compute_factor
    rand(0...35)
  end

end
