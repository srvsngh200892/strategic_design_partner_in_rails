class Tracks::TrackDetail

  # Its a base class add functionality common to all the track

  def track_slowness_factor(context=nil)
    raise 'Abstract method called'
  end


  # Add common functionality

end
