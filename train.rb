require_relative 'company_name_module.rb'

class Train
  include CompanyName
  attr_accessor :name, :speed, :station

  NAME_FORMAT = /^[a-z0-9]{3}-*[a-z0-9]{2}$/i.freeze

  @@instances = []
  def self.all
    @@instances
  end

  def self.find(name)
    Train.all.find { |train| train.name == name }
  end

  def initialize(name, route, station, carriages = [], speed = 0)
    @name = name
    @route = route
    @station = station
    @carriages = carriages
    @speed = speed
    validate!
    @@instances.push(self)
  end

  def go
    self.speed += 20
  end

  def stop
    self.speed = 0
  end

  def count_carriages
    @carriages.count
  end

  def add_carriages(carriage)
    @carriages.push(carriage) if speed.zero?
  end

  def remove_carriages(carriage)
    @carriages.delete(carriage) if speed.zero?
  end

  def show_stations
    station_index = @route.stations.find_index(station)
    puts previous_station = @route.stations[station_index - 1].name
    puts current_station = @route.stations[station_index].name
    puts next_station = @route.stations[station_index + 1].name
  end

  def next_station
    current_station_index = @route.stations.find_index(station)
    self.station = @route.stations[current_station_index + 1]
  end

  def valid?
    validate!
  rescue StandardError
    false
  end

  def strange_block
    carriage = @carriages
    yield carriage
  end

  protected

  def validate!
    raise "Name can't be nil" if name.nil?
    raise 'Name should be at least 6 symbols' if name.length < 6
    raise 'Name has invalid format' if name !~ NAME_FORMAT
    raise "Route can't be nil" if @route.nil?
    raise 'Route should be Route' if @route.is_a?(Route) != true
    raise "Speed can't be negative" if speed < 0
    raise 'Name should be unic' if @@instances.find { |train| train.name == name }

    true
  end
end
