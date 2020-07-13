class RailwayStation
  attr_reader :name

  @@instances = []
  @@instances_name = []

  def self.all_name
    @@instances_name
  end

  def self.all
    @@instances
  end

  def initialize(name, trains = [])
    @name = name
    @trains = trains
    validate!
    @@instances_name.push(@name)
    @@instances.push(self)
  end

  def arrive(train)
    @trains.push(train)
  end

  def departure(train)
    @trains.delete(train)
  end

  def show_trains
    @trains
  end

  def count_train
    @trains.count
  end

  def strange_block
    trains = @trains
    yield(trains)
  end
  
  def valid?
    validate!
  rescue StandardError
    false
  end

  protected

  def validate!
    raise "Name can't be nil" if name.nil?
    raise "Name can't be nil" if name.length < 2

    true
  end
end
