class MapPoint

  def initialize(lat1,lon1)
    @lat1=lat1
    @lon1=lon1
  end

  def distance(p2)
    rad = (Math::PI)/180
    lat1 = @lat1*rad
    lon1 = @lon1*rad
    lat2 = p2.instance_variable_get(:@lat1) * rad
    lon2 = p2.instance_variable_get(:@lon1) * rad
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    r = 6373
    a = ((Math.sin(dlat/2))**2) + Math.cos(lat1) * Math.cos(lat2) * ((Math.sin(dlon/2))**2)
    c = 2 * Math.atan2( Math.sqrt(a), Math.sqrt(1-a) )
    distance = r*c
    return distance.round(3)
  end
end

p1 = MapPoint.new(38.898556, -77.037852)
p2 = MapPoint.new(38.897147, -77.043934)

p1.distance(p2)

