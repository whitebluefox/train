class Route
  attr_accessor :stations

  def initialize(start, finish, stations = [])
    @start = start
    @finish = finish
    @stations = stations.unshift(@start).push(@finish)
    validate!
  end

  def add_station(stations)
    @stations.insert(-2, stations)
  end

  def remove_station(stations)
    @stations.delete(stations)
  end

  def stations_list
    @stations
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise "Start can't be nil" if @start.nil?
    raise 'Start should be railway station' if @start.is_a?(RailwayStation) != true
    raise "Start can't be finish" if @start == @finish
    raise "Finish can't be nil" if @finish.nil?
    raise 'Finish should be railway station' if @finish.is_a?(RailwayStation) != true
    raise "Finish can't be start" if @finish == @start

    true
  end
end
