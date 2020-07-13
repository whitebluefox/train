require_relative 'route.rb'
require_relative 'railway_station.rb'
require_relative 'passanger_train.rb'
require_relative 'cargo_train.rb'
require_relative 'passanger_carriage.rb'
require_relative 'cargo_carriage.rb'

begin
  @station = RailwayStation.new('st')
  @station_1 = RailwayStation.new('st1')
  @station_2 = RailwayStation.new('st2')
  @station_3 = RailwayStation.new('st3')
  @station_4 = RailwayStation.new('st4')
rescue StandardError
  puts "Station isn't valid!"
end

begin
  @route = Route.new(@station, @station_1)
  @route.add_station(@station_2)
  @route.add_station(@station_3)
  @route.add_station(@station_4)
rescue StandardError
  puts "Route isn't valid!"
end

begin
  @cargo_carriage = CargoCarriage.new
  @passanger_carriage = PassangerCarriage.new
rescue StandardError
  puts "Carriage isn't valid!"
end

begin
  @passanger_train = PassangerTrain.new('abc-df', @route, @station)
  @cargo_train = CargoTrain.new('123-23', @route, @station)
rescue StandardError
  puts "Train isn't valid!"
end
puts 'after rescue'
